build:
	crystal build src/mustached.cr

release:
	crystal build src/mustached.cr --release

clean:
	rm mustached

install:
	cp mustached /usr/bin/mustached

uninstall:
	rm /usr/bin/mustached

.PHONY: install
