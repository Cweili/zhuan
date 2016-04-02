pkg = require('../package.json')

exports.dir =
  bin: 'bin'
  lib: 'lib'
  tpl: 'tpl'
  dist: 'dist'
  tmp: '.tmp'

exports.webpack =
  devPort: 8000

exports.$ =
  autoprefixer: require('gulp-autoprefixer')
  coffee: require('gulp-coffee')
  connect: require('gulp-connect')
  defineModule: require('gulp-define-module')
  del: require('del')
  htmlmin: require('gulp-htmlmin')
  inlineSource: require('gulp-inline-source')
  marked: require('gulp-marked')
  replace: require('gulp-replace')
  runSequence: require('run-sequence')
  sourcemaps: require('gulp-sourcemaps')
  stylus: require('gulp-stylus')
  template: require('gulp-template')
  util: require('gulp-util')

exports.pkg = pkg
