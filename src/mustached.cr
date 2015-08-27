require "option_parser"
require "crustache"
require "json"

require "./mustached/*"

module Mustached
	args = {} of Symbol => String

	OptionParser.new do |opts|
		opts.separator
		opts.separator "  Usage: mustached [options]"
		opts.separator
		opts.separator "  Options:"
		opts.separator

		opts.on("-h", "--help", "Display help") do
			puts opts.to_s
			exit
		end

		opts.on("-v", "--version", "Display version") do
			puts VERSION
			exit
		end

		opts.on("-f path", "--file path", "Data file") do |path|
			args[:data_path] = path;
		end

		opts.on("-t path", "--template path", "Template file") do |path|
			args[:template_path] = path;
		end

		opts.separator
		opts.separator
	end.parse!

	data = ""

	if args[:data_path]?
	  data = File.read args[:data_path]
	else
	  data = STDIN.read
	end

	parsed_data = JSON.parse data

	template = File.read args[:template_path]
	compiled_template = Crustache.parse template

	puts Crustache.render(compiled_template, parsed_data)
end
