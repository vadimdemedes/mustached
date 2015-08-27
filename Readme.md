# mustached

Render Mustache templates with a JSON at input.
This tool was created with a purpose to use it in bash scripts.


### Installation

You can download pre-built binaries for OS X and Linux or compile mustached manually.

Install on Linux:

```
$ wget https://github.com/vdemedes/mustached/raw/master/bin/mustached-linux-x64 -O mustached
$ chmod +x mustached
$ [sudo] mv mustached /usr/bin/mustached
```

Install on OS X:

```
$ wget https://github.com/vdemedes/mustached/raw/master/bin/mustached-darwin-x64 -O mustached
$ chmod +x mustached
$ [sudo] mv mustached /usr/bin/mustached
```

Compile manually (requires [Crystal](http://crystal-lang.org/)):

```
$ git clone https://github.com/vdemedes/mustached.git
$ cd mustached
$ crystal deps
$ make release
```


### Usage

hello.mustache:

```mustache
Hello {{ name }}
```

data.json:

```json
{
	"name": "Vadim"
}
```

```
$ cat data.json | mustached -t hello.mustache
```

or alternatively:

```
$ mustached -t hello.mustache -f data.json
```


### License

MIT © [Vadym Demedes](http://vadimdemedes.com)
