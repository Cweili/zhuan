gulp = require('gulp')

config = require('./config')
$ = config.$
dir = config.dir

gulp.task('s', ['server'])

gulp.task('server', [
  'watch'
  'connect'
])

gulp.task('connect', ['compile'], ->
  $.connect.server(
    port: config.port
    root: config.output
    livereload: port: 35733
    debug: true
    fallback: if config.file.indexOf('*') > -1 then undefined else config.outputFile
  )
)

gulp.task('watch', ['compile'], ->
  gulp.watch([config.file], ['compile'])
)
