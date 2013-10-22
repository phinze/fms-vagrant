# You know you don't want to set up Flash Media Server

But maybe you have to!

## Let's automate it!

This will get you Flash Media Server (4.5) up and running on a VM at http://fms.vagrant.dev in one shot.

## Prereqs

  * A happy vagrant - recent version supporting the v2 Vagrantfile syntax
  * A friendly [landrush][] plugin for DNS; if you don't have it, that's okay! Do this:
    1. `vagrant plugin install landrush` to download the plugin
    2. `vagrant landrush install` to set up the DNS resolved on your host machine

[landrush]: https://github.com/phinze/landrush

## Usage

```bash
git clone https://github.com/phinze/fms-vagrant
cd fms-vagrant
vagrant up
```

Yeah… that's pretty much it.

When it's done, head on over to http://fms.vagrant.dev; the default credentials are:

 * __user__: fmsadmin
 * __password__: adminadmin

## Editions / Serial Numbers

By default this will install the __Development Edition__ of Flash Media Server. If you have a serial number for another version, you can specify it as an environment variable.

```
FMS_SERIAL=1234-567890-4321 vagrant up
```

## Caching

The big ol' zip file we have to download for FMS clocks in at around 500MB. But we cache it on the host so you only need to download it once.

## All done?

You can destroy the VM with reckless abandon, since the automation will spin it back up for you no problem. And with the caching mentioned above, the second time around should be much faster.

```bash
vagrant destroy # DESTROY DESTROY!
```


