# Conventional Commits cheatsheet

See [Conventional Commits](https://conventionalcommits.org/) spec.

aka [Angular Commit Message Guidelines](https://github.com/angular/angular/blob/master/CONTRIBUTING.md#commit).

```text
<type=feat|fix|perf|build|ci|chore|docs|refactor|revert|style|test>[(optional scope)]: <description, imperative, present tense, lowercase, no dot at end>

[
  Optional body section.

  Motivation for the change and contrast with previous behaviour.

  Can span multiple lines.
]

[BREAKING CHANGE: :warning: <description, imperative, present tense, lowercase, no dot at end>]

[Closes / Fixes #123, #456, #789]

[
  - Additional links and meta-information
  - Additional links and meta-information
  - Additional links and meta-information
]
```

## Main types

- feat
  - :sparkles:
  - Feature
  - Change log entry
  - Minor semantic version (aka feature release)
- fix
  - :bug:
  - Bug fix
  - Change log entry
  - Patch semantic version
- perf
  - :racehorse:
  - Performance
  - Change log entry
  - Patch semantic version

### Additional types

Other types are up to your discretion. Below are some suggestions.

- build
  - :construction_worker:
  - Changes that affect the build system or external dependencie
- ci
  -:green_heart:
- chore
  - :zzz:
  - Maintenance
- docs
  - :book:
- refactor
  - :cyclone:
  - Code change that neither fixes a bug nor adds a feature
- revert
  - :rewind:
  - Description must be same as description of commit reverted
  - Body must include "reverts commit <hash>"
- style
  - :ribbon:
  - Changes that do not affect meaning of code
  - White space, formatting, missing semi-colons, etc
- test
  - :white_check_mark:

## Relationship with change log and semantic version

- `BREAKING CHANGE:` = entry in change log (for _all_ types), and _major_ semantic version (breaking release)
- `feat` = entry in change log, and _minor_ semantic version (feature release)
- `fix` and `perf` = entry in change log, and _patch_ semantic version
