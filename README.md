# Facebook Build Scripts

This repository provides an environment and build scripts to build and
package 3 facebook projects:
[Folly](https://github.com/facebook/folly.git),
[FBThrift](https://github.com/facebook/fbthrift.git) and
[Proxygen](https://github.com/facebook/proxygen.git).

I made this because I wanted to have Ubuntu packages for Proxygen and
its dependencies, and facebook doesn't publish any themselves.

If you'd rather just use my prebuilt packages, they are published at
BinStash for direct use:
[http://binstash.com/blakesmith/fb](http://binstash.com/blakesmith/fb).

Note: These packages are not signed.
Built for: _Ubuntu 14.04 (Trusty), 64-bit_

## Dependencies

* VirtualBox
* Vagrant (I use version 1.6.5)

## Building

To build all packages, run:

1. `vagrant up fbbuild`. This will download the `ubuntu/trust64`
vagrant box and provision it with all the necessary dependencies for building.
2. `vagrant ssh fbbuild` to ssh into the provisioned VM.
3. `cd /vagrant` Change to the build directory.
4. `make` This will build packages for all the projects in order:
Folly, FBThrift, Proxygen.

After building, packages will be available in their respective project directories.
