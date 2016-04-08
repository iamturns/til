Export vagrant
==============

Give the box a name within your Vagrant file:

```
vb_config.customize [
    'modifyvm', :id,
    '--name', 'example'
]
```

And export to a .box file with:

```
vagrant package --base example --output example.box
```
