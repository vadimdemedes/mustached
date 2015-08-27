build:
	crystal build src/mustached.cr

release:
	crystal build src/mustached.cr -o bin/mustached-darwin-x64 --release
	docker build -t mustached -f Dockerfile.build .
	docker run -d --name mustached mustached bash
	docker cp mustached:/home/mustached-linux-x64 bin
	docker kill mustached
	docker rm mustached

clean:
	rm mustached

install:
	cp mustached /usr/bin/mustached

uninstall:
	rm /usr/bin/mustached

.PHONY: install
