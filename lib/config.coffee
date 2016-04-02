path = require('path')

exports.$ =
  connect: require('gulp-connect')
  marked: require('gulp-marked')
  htmlmin: require('gulp-htmlmin')
  replace: require('gulp-replace')
  util: require('gulp-util')

argv = exports.argv = require('minimist')(process.argv.slice(2))

file = argv.f || argv.file || '*'
if !/\.(md|markdown)$/.test(file)
  file += '.{md,markdown}'

parsed = path.parse(file)

exports.file = file
output = exports.output = argv.o || argv.output || parsed.dir || './'

exports.outputFile = parsed.base.replace(parsed.ext, '.html')

exports.port = argv.p || argv.port || 8000
