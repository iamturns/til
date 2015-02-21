Nginx cheatsheet
================

Server block
------------

Nginx matches closest based on `listen` and `server_name`

Listen value rules:
- Default value: `0.0.0.0:80`
- `111.111.111.111` becomes `111.111.111.111:80`
- `80` becomes `0.0.0.0:80`

`server_name` is only evaluated if `listen` does not narrow to one serer block

Location block
--------------

Format:

```
location optional_modifier location_match {
}
```

Modifiers;

- `(none)` prefix match
- `=` exact match
- `~` case sensitive regex
- `~*` case insensitive regex

Only one location block will be run

With regex matches, the *first* match is used, so order the blocks wisely

Some directives lead to another redirect, and another location block being loaded;
- index
- try_files
- rewrite
- error_page






