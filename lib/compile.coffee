gulp = require('gulp')

zhuan = require('./zhuan')
render = require('./render')
config = require('./config')
$ = config.$

gulp.task('c', ['compile'])

gulp.task('compile', ->
  gulp.src(config.file)
    .pipe($.marked(
      renderer: render
      langPrefix: 'line-numbers language-'
    ))
    .pipe($.htmlmin(
      collapseWhitespace: true
      removeAttributeQuotes: true
      removeComments: true
      removeCommentsFromCDATA: true
      removeScriptTypeAttributes: true
      removeStyleLinkTypeAttributes: true
      useShortDoctype: true
      minifyJS: true
      minifyCSS: true
    ))
    .pipe($.replace(/([\S\s]*)/m, (content) ->
      title = /<h\d.*?>(.*?)<\/h\d>/.exec(content)?[1] || /<.*?>(.*?)<\/.*?>/.exec(content)?[1]
      zhuan(
        title: title
        content: content
      )
    ))
    .pipe(gulp.dest(config.output))
    .pipe($.connect.reload())
)
