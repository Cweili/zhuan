gulp = require('gulp')

require('./compile')
require('./server')

gulp.task('default', ['server'])
