rbenv
=====

List versions;

    rbenv install --list

Install version;

    rbenv install 2.2.1

Rehash is required after new versions or gems that provide commands;

    rbenv rehash

Use version globally;

    rbenv global 2.2.1

Revert global to default;

    rbenv global system

Use version locally in project. Stored in `.ruby-version` file.

    rbenv local 2.2.1
