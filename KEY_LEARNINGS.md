# Key Learnings Summary

A comprehensive extraction of the most valuable insights from this TIL repository, organized by domain.

---

## Git Workflow & Best Practices

### Commit Message Standards
- **Format**: `<type>[(scope)]: <description>`
- **Types**: feat, fix, perf, build, ci, chore, docs, refactor, revert, style, test
- **Versioning Impact**: `BREAKING CHANGE:` → major, `feat` → minor, `fix/perf` → patch
- **Style**: Use imperative, present tense, lowercase, no ending dot
- 📍 *Source: dev/git/conventional-commits-cheatsheet.md*

### Keeping Commits Clean
- **Interactive rebase**: `git rebase --interactive HEAD~[number]`
- **Split commits**: Mark as 'edit', then `git reset HEAD^` to unstage
- **Revert strategies**: Pushed commits → `git revert`, unpushed → `git reset --soft HEAD~1`
- 📍 *Source: dev/git/tidy-commits.md*

### Stash Best Practices
- **Pro tip**: Run `git add -A` before stashing to include untracked files
- **Named stashes**: `git stash save "descriptive name"` for clarity
- **Late branching**: `git stash` + `git stash branch [name]` when you should have branched earlier
- **Temporary only**: Use `git stash pop` to apply and drop in one command
- 📍 *Source: dev/git/stash.md*

### Branch Management
- **Clean up deleted remotes**: `git fetch origin --prune`
- **Squash merge gotcha**: Use `git branch -vv | awk '/: gone]/{print $1}' | xargs git branch -d` for cleanup
- **Simple workflow**: Feature branch → rebase with master → merge (fast-forward with linear history)
- 📍 *Source: dev/git/sync-branches.md, dev/git/workflow.md*

### Line Endings Consistency
- **Best practice**: Use `.gitattributes` file for cross-platform consistency
- **Late fix**: Save files → `git rm --cached -r .` → reset hard → re-add → commit
- 📍 *Source: dev/git/line-endings.md*

---

## API Design & Authentication

### JWT (JSON Web Tokens)
- **Structure**: Base64 URL-encoded header + claims, separated by dots, with signature
- **Standard claims**:
  - `iss` (issuer)
  - `aud` (audience)
  - `iat` (issued at)
  - `exp` (expiration - typically 1 hour for access tokens)
  - `sub` (subject/UserID)
- **Usage**: De facto standard for OAuth2 and OpenID
- 📍 *Source: dev/api/jwt-json-web-tokens.md*

### OAuth2
- **Components**:
  - Resource Owner (user)
  - Resource Server (API)
  - Authorization Server (issues keys)
  - Client (your code)
- **Four flows**: Authorization Code (server-side), Implicit (client-side), Resource Owner Password (trusted apps), Client Credentials (machine-to-machine)
- **Security critical**: Access tokens MUST use SSL, validate redirect URLs against whitelist
- 📍 *Source: dev/api/oauth2.md*

### GraphQL
- **Key benefits**: Clients request exactly what they need, strongly typed schema, excellent tooling
- **Resolver pattern**: Each field has resolver with 4 args: parent, args, context, info
- **Schema stitching**: Introspect remote GraphQL servers to combine multiple APIs
- **Bindings**: Wrap GraphQL APIs in typed functions for easier consumption
- 📍 *Source: dev/api/graphql.md*

---

## JavaScript Best Practices

### Code Documentation (JSDoc)
- **Parameter syntax**:
  - Optional: `[paramName]`
  - Defaults: `[paramName="value"]`
  - Union types: `(type1|type2)`
  - Arrays: `type[]`
  - Nullable: `?type`
- **Custom types**: `@typedef` for objects, `@callback` for functions
- 📍 *Source: dev/javascript/jsdoc.md*

### Event Handling
- **Debounce**: Waits X ms after last event before calling
- **Throttle**: Calls at beginning, then every X ms while event fires
- **Event targets**: `e.target` = where event occurred, `e.currentTarget` = where handler attached
- **Event control**:
  - `e.preventDefault()` → stops default behavior
  - `e.stopPropagation()` → stops bubbling to parents
  - `e.stopImmediatePropagation()` → stops bubbling AND other handlers on same element
- 📍 *Source: dev/javascript/debounce-throttle-pause.md, dev/javascript/event-target-vs-current-target.md, dev/javascript/stop-event-behaviour.md*

### Redux Patterns
- **Core principles**: Single store, state is read-only, dispatch actions
- **Pure reducers**: Same input = same output, no side effects, don't modify parameters
- **Immutability patterns**:
  - Add: `[...list, item]` (not `push()`)
  - Remove: `slice()`
  - Update object: `Object.assign({}, ...)`
- 📍 *Source: dev/javascript/redux.md*

### NPM Best Practices
- **Dependency types**:
  - `dependencies` → runtime
  - `devDependencies` → development only
  - `bundledDependencies` → bundled modules
- **Scripts**: Define in package.json, run with `npm run [name]`
- **Hooks**: Auto-run `pre[task]` and `post[task]` for install/uninstall/publish/update
- **Version bumping**: `npm version patch|minor|major` → commit + tag → `npm publish`
- 📍 *Source: dev/javascript/npm.md*

### Module Systems
- **Global**: Avoid (pollutes global scope)
- **AMD** (RequireJS): Asynchronous
- **CommonJS** (Node/npm): Synchronous
- **ES6**: Modern standard with export/import
- 📍 *Source: dev/javascript/modules.md*

---

## PHP Best Practices

### Array Manipulation
- **array_merge**: String keys overwritten by latest, numerical keys appended
- **+ operator**: Left hand takes precedence regardless of key type
- **Best practice**: Use `array_merge` most of the time, `+` only for associative arrays
- 📍 *Source: dev/php/array-merge-vs-+.md*

### Security
- **Variable escaping**: `htmlspecialchars($variable, ENT_QUOTES, 'utf-8')`
- 📍 *Source: dev/php/escape-variables.md*

### PHPDoc Patterns
- **Fluent interfaces**: `@return self`
- **Inheritance**: `{@inheritDoc}`
- **Inline type hints**: `/* @var $var \Class\Name */`
- **Arrays of objects**: `SomeObject[]`
- 📍 *Source: dev/php/phpdoc.md*

---

## HTML & CSS

### Form Handling
- **Testing tip**: Add `novalidate` to `<form>` element to disable HTML5 validation
- 📍 *Source: dev/html/disable-html5-form-validation.md*

### Email Templates
- **Best scaffold**: MailChimp's email-blueprints
- **Table pattern**: `<table border="0" cellpadding="0" cellspacing="0" width="100%">`
- **Gmail gotchas**:
  - Styles must be in `<head>`
  - Only element selectors work
  - Strips media queries
- **Best practice**: Avoid padding/margins, use extra tr/td with spacer gifs, mark media styles `!important`
- 📍 *Source: dev/html/email-template-scaffold.md*

### Flexbox
- **Container properties**: flex-direction, justify-content, align-items, flex-wrap, align-content
- **Item properties**:
  - `flex-basis` → starting size
  - `flex-grow` → growth factor
  - `flex-shrink` → shrink behavior
- **Shorthand patterns**:
  - `flex: initial` → 0 1 auto
  - `flex: auto` → 1 1 auto
  - `flex: none` → 0 0 auto
  - `flex: 5` → 5 1 0
- **Gotchas**: `float` and `vertical-align` have no effect; IE10-11 requires unitless `flex-basis`
- **Alignment trick**: `margin-left: auto` pushes item to right
- 📍 *Source: dev/style/flexbox.md*

### Responsive Images
- **Padding-top trick**: Container with `width: 100%; height: 0; padding-top: 88%` (aspect ratio)
- **Background approach**: Use `background-size: cover` with same container pattern
- 📍 *Source: dev/style/maintain-image-aspect-ratio-responsively.md*

---

## Testing

### Jasmine Framework
- **Structure**: `describe()` for suites, `it()` for specs, `expect()` for expectations
- **Matchers**: toBe (===), toEqual (==), toMatch (regex), toBeDefined, toBeNull, toBeTruthy, toContain, toBeLessThan, toThrow
- **Lifecycle**: beforeEach, afterEach, beforeAll, afterAll
- **Spies**: `spyOn(object, 'functionName')` with `.and.callThrough()`, `.and.returnValue()`, `.and.throwError()`
- **Disable tests**: Add 'x' prefix to `describe` or `it`
- 📍 *Source: dev/testing/jasmine.md*

---

## System Administration

### Terminal Productivity
- **Navigation**: `cd -` returns to previous directory
- **Disk usage**: `du -h --max-depth=1` shows usage by folders
- 📍 *Source: sysadmin/terminal/cheatsheet.md, sysadmin/terminal/disk-usage.md*

### File Operations
- **Find files**: `find /path/ -name '*.xxx'`
- **Search in files**: `grep -r 'search term' /directory/`
- **Search and replace**: `sed -i -s 's/SEARCH/REPLACE/g' file`
- 📍 *Source: sysadmin/terminal/search.md*

### Rsync Best Practices
- **Base command**: `rsync -rvzP --delete [src] [dest]`
  - `-r` → recursive
  - `-v` → verbose
  - `-z` → compress
  - `-P` → progress
  - `--delete` → remove deleted files
- **Modes** (add one): `-t` (time), `-a` (archive), `--size-only`, `-c` (checksum)
- **Daylight saving fix**: `--modify-window=60`
- 📍 *Source: sysadmin/terminal/rsync.md*

### Compression
- **Tar create**: `tar -cvf archive input_dir`
- **Tar extract**: `tar -xvf archive [-C output_dir]`
- **Compression flags**: `-z` (gz), `-j` (bz2), `-a` (auto)
- **Zip**: `zip -r archive.zip directory` and `unzip archive.zip`
- 📍 *Source: sysadmin/terminal/compression.md*

### Vim Essentials
- **Navigation**: h/j/k/l (direction), w/e/b (word), f[char] (jump), 0/$ (line start/end), gg/G (file start/end)
- **Editing**: x/X (delete char), d (delete with movement), p (paste), . (repeat)
- **Search**: /[term] (search), n/N (next/prev), * (next occurrence of word under cursor)
- 📍 *Source: sysadmin/terminal/vim.md*

### MySQL Operations
- **Import**: `mysql -u username -p databasename < filename`
- **Export database**: `mysqldump -u username -p dbname > filename`
- **Export table**: `mysqldump -u username -p databasename tablename > filename`
- **Export query**: `mysqldump --databases X --tables Y --where="column < 1000"`
- **Single query**: `mysql -u username -p -e "query"`
- 📍 *Source: sysadmin/mysql/cheatsheet.md*

### SSH Keys
- **Generate default**: `ssh-keygen -t rsa -C "email - Machine ID"` then `ssh-add ~/.ssh/id_rsa`
- **Additional keys**: Use `-f ~/.ssh/custom_name_rsa` for custom filenames
- 📍 *Source: sysadmin/other/ssh-key.md*

### Apache Optimization
- **KeepAlive**: Set timeout to 1.5-2x page load speed
- **TimeOut**: ~20 seconds (default 2 minutes is too long)
- **MaxClients formula**: `Total RAM / Max child process size`
- **Critical balance**: Too low = waiting clients, too high = swapping death spiral
- **MaxRequestsPerChild**: Set non-zero to solve memory leaks, but not too low
- 📍 *Source: sysadmin/apache/optimization.md*

### Nginx SSL
- **Simple config**: 4 lines - listen 443, ssl on, certificate paths
- 📍 *Source: sysadmin/nginx/ssl.md*

---

## Developer Tools

### VS Code Shortcuts
- **Navigation**: Cmd+P (quick open), Cmd+Shift+P (command palette), Ctrl+Tab (tab history)
- **Multi-cursor**: Cmd+D (next occurrence), Option+Click (add cursor), Option+Cmd+Up/Down
- **Search**: Shift+Cmd+O (symbols in file), Cmd+T (symbols across files)
- **Toggle**: Cmd+B (sidebar), Ctrl+` (terminal), F8 (loop through errors)
- 📍 *Source: misc/vscode.md*

### iTerm Cursor Movement
- **Line**: Ctrl+a (start), Ctrl+e (end)
- **Word**: Escape+b (back), Escape+f (forward)
- **Delete**: Ctrl+k (to end), Ctrl+u (to start)
- 📍 *Source: misc/keyboard-shortcuts.md*

### Chrome DevTools
- **Search**: Cmd+P (file), Cmd+Shift+P (method/selector)
- **Value increment**: Up/Down/PageUp/PageDown/Alt
- 📍 *Source: misc/keyboard-shortcuts.md*

---

## Code Conventions

### Naming Patterns
- **Paired opposites**:
  - init/terminate
  - create/destroy
  - setUp/tearDown
  - display/hide
  - activate/deactivate
- 📍 *Source: dev/other/naming-conventions.md*

---

## Repository Insights

### Coverage Analysis
- **32 entries analyzed** across diverse topics
- **Strong focus areas**:
  1. Git workflow and commit hygiene
  2. Modern JavaScript ecosystem (Redux, NPM, modules)
  3. API architecture (OAuth2, JWT, GraphQL)
  4. System administration fundamentals
  5. Code documentation practices
  6. Developer productivity tools

### Philosophy
- **Practical over theoretical**: Real-world problems and solutions
- **Concise and actionable**: Quick reference format
- **Cross-cutting concerns**: Documentation, security, optimization
- **Developer ergonomics**: Keyboard shortcuts, IDE configs, workflow efficiency

---

*Last updated: 2025-11-08*
*Generated from TIL repository analysis*
