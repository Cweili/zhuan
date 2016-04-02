# Zhuan

[![zhuan](http://git.oschina.net/Cweili/zhuan/raw/master/zhuan.png)](http://www.zdic.net/z/1a/js/64B0.htm)

Compile your markdown document to html.

一个将你撰写的 Markdown 文档编译为 HTML 的工具。

[![npm](https://nodei.co/npm/zhuan.png?downloads=true&stars=true)](https://www.npmjs.com/package/zhuan)

## Install

```
npm install -g zhuan
```

## Usage

Tasks can be executed by running

```
zhuan <task> <options>
```

For example `zhuan server -f README.md -o output`.

## Tasks

* `server` or `s` - Start a livereload server on `http://localhost:8000`.
* `compile` or `c` - Compile your markdown document.

Default task is `server`, so you can just run `zhuan`.

## Options

* `-f` or `--file` - Specific the markdown file. Default is all markdown files in current dir. Default file extension `.md` or `.markdown` can be omitted.
* `-o` or `--output` - Specific the output dir. Default is current dir.
* `-p` or `--port` - Specific the server port. Default is 8000.
