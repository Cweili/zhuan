gulp = require('gulp')

config = require('./config')
$ = config.$
dir = config.dir

gulp.task('build', (done) ->
  $.runSequence(
    'del'
    'build:concurrent'
    done
  )
)

gulp.task('build:concurrent', [
  'tpl'
  'lib'
  'bin'
  'copy'
])

gulp.task('del', ->
  $.del([
    dir.tmp
    dir.dist
  ])
)

gulp.task('lib', ->
  gulp.src("#{dir.lib}/**/*.coffee")
    .pipe($.replace(/^(.)/, '"use strict"\n$1'))
    .pipe($.coffee(bare: true)).on('error', $.util.log)
    .pipe(gulp.dest("#{dir.dist}/#{dir.lib}"))
)

gulp.task('bin', ->
  gulp.src("#{dir.bin}/**/*")
    .pipe(gulp.dest("#{dir.dist}/#{dir.bin}"))
)

gulp.task('copy', ->
  gulp.src([
    'package.json'
    'README.md'
    'LICENSE'
  ])
    .pipe(gulp.dest(dir.dist))
)
