fs = require('fs')
_ = require('lodash')
gulp = require('gulp')

config = require('./config')
$ = config.$
dir = config.dir

gulp.task('dev', [
  'watch'
  'stylus'
  'coffee'
  'connect'
])

gulp.task('compile', ->
  gulp.src('test/index.md')
    .pipe($.marked(
      renderer: require("../#{dir.lib}/render")
      langPrefix: 'line-numbers language-'
    ))
    .pipe($.replace(/([\S\s]*)/m, (content) ->
      title = /<h\d.*?>(.*?)<\/h\d>/.exec(content)?[1] || /<.*?>(.*?)<\/.*?>/.exec(content)?[1]
      _.template(fs.readFileSync("#{dir.tpl}/zhuan.html"))(
        title: title
        content: content
      )
    ))
    .pipe(gulp.dest(dir.tmp))
)

gulp.task('connect', ['compile'], ->
  $.connect.server(
    port: 8000
    root: [dir.tmp, 'node_modules']
    debug: true,
    livereload: true
  )
)

gulp.task('watch', ->
  gulp.watch(["#{dir.tpl}/*.html"], ['compile'])
  gulp.watch(["#{dir.tpl}/**/*.styl"], ['stylus'])
  gulp.watch(["#{dir.tpl}/*.coffee"], ['coffee'])
)
