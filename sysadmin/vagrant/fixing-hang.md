Vagrant - fixing hang
=====================

If the box does not shut down properly, the next time it starts up it may be stuck in boot screen

You can possibly see this within the 'Preview' area within the VirtualBox app itself

A couple of options;

1. GUI

Add this to your Vagrantfile, then you can see what's going on and fix it;

```
config.vm.provider :virtualbox do |vb|
  vb.gui = true
end
```

2. Send the 'enter' command via CLI

```
vboxmanage list runningvms

# "homestead" {7ffe04db-5c0f-4b93-a9e5-6ef16b0ae41a}

vboxmanage controlvm homestead keyboardputscancode 1c

```
