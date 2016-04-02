gulp = require('gulp')

config = require('./config')
$ = config.$
dir = config.dir

gulp.task('tpl', [
  'coffee'
  'stylus'
], ->
  gulp.src("#{dir.tpl}/*.html")
    .pipe($.replace('@@build.name', config.pkg.name))
    .pipe($.replace('@@build.version', config.pkg.version))
    .pipe($.replace(/"(\w+)\.(js|css)"/g, '"' + "../#{dir.tmp}/$1.$2" + '"'))
    .pipe($.inlineSource(
      rootpath: 'node_modules'
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
    .pipe($.template.precompile())
    .pipe($.defineModule('node', require: _: 'lodash'))
    .pipe(gulp.dest("#{dir.dist}/#{dir.lib}"))
)

gulp.task('stylus', ->
  gulp.src("#{dir.tpl}/styles/index.styl")
    .pipe($.sourcemaps.init())
    .pipe($.stylus(
      include: [
        'node_modules/bootstrap-styl'
        'node_modules/nib/lib'
      ]
    )).on('error', $.util.log)
    .pipe($.autoprefixer(
      browsers: [
        'last 3 versions'
        'Android > 1'
        'iOS > 4'
        'ie 8'
        '> 1%'
      ]
    )).on('error', $.util.log)
    .pipe($.sourcemaps.write())
    .pipe(gulp.dest(dir.tmp))
    .pipe($.connect.reload())
)

gulp.task('coffee', ->
  gulp.src("#{dir.tpl}/*.coffee")
    .pipe($.replace(/^(.)/, '"use strict"\n$1'))
    .pipe($.coffee()).on('error', $.util.log)
    .pipe(gulp.dest(dir.tmp))
    .pipe($.connect.reload())
)
