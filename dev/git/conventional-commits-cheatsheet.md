# Conventional Commits cheatsheet

See [Conventional Commits](https://conventionalcommits.org/) spec.

aka [Angular Commit Message Guidelines](https://github.com/angular/angular/blob/master/CONTRIBUTING.md#commit).

```text
<fix|feat|build|ci|chore|docs|perf|refactor|feature|revert|style|test>[(optional scope)]: <description, imperative, present tense, lowercase, no dot at end>

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

## Standard types

- fix
  - :bug:
  - Bug fix
  - Correlates with PATCH in semantic versioning
- feat
  - :sparkles:
  - New feature
  - Correlates with MINOR in semantic versioning

## Additional types

These do not affect semantic versioning.

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
- perf
  - :racehorse:
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

## Semantic versioning

### Major

The text "BREAKING CHANGE: " exists at beginning of optional body or footer text.

### Minor

Type: feat

### Patch

Type: fix
