Gulp + BrowserSync
==================

```
var browserSync = require('browser-sync');

var browserSyncConfig = {
  server: {
    baseDir: "./"
  },
  startPath: "demo/"
};

var browserSyncServer = browserSync.create();

gulp.task('develop', function() {

  browserSyncServer.init(browserSyncConfig);

  gulp.watch('./**/*.js', function() {
    gulp.src('./**/*.js').pipe(browserSyncServer.stream());
  });

  gulp.watch('./**/*.html').on('change', browserSyncServer.reload);

});

gulp.task('whatever', function() {
  return gulp.
    src('./**/*').
    pipe(gulp.dest('./')).
    pipe(browserSyncServer.stream());
});
```