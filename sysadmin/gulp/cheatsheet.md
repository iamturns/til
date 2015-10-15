Gulp cheatsheet
===============

Install package
===============

```
npm install --save-dev {{package-name}}
```

Running shell commands
======================

### Misc 

Not all commands support running via pipes

Use `gulp.src('')` to set it off, if needed

### gulp-shell



- gulp-shell
  - Prints output from command immediately
- gulp-exec
  - Deprecated
- gulp-spawn
  - Seems to be a wrapper for child_process.spawn
  - Seems to handle error reporting, and provide a cleaner interface too
- gulp-run
  - No longer maintained
- child_process
  - .spawn
    - Returns a stream (probably what you want for gulp!)
    - Object has stdout and stderr streams
    
```
child_process.spawn(command, [args], [options])
```
    
  - .exec
    - Waits for process to end, then returns entire buffer (max 200k by default)


Simple example of exec

Waits until complete, and returns entire buffer (max 200k by default) (I think)

```
var exec = require('child_process').exec;
exec('command', function(error, stdout, stderr) {
  console.log('stdout: ', stdout);
   console.log('stderr: ', stderr);
   if (error !== null) {
     console.log('exec error: ', error);
   }
});
```

Instead, listen to stdout and stderr;

I think this works the same with spawn, as well?

```
var exec = require('child_process').exec;
var child = exec('command');
child.stdout.on('data', function(data) {
    console.log('stdout: ' + data);
});
child.stderr.on('data', function(data) {
    console.log('stdout: ' + data);
});
child.on('close', function(code) {
    console.log('closing code: ' + code);
});
```

I have also seen a `child.on('exit')` instead of `child.on('close')`
