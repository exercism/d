# Prerequisites

The D language track requires that you have the following software installed on your system:

* a D version 2 compiler
* (optional but recommended) DUB

## Prerequisite: D version 2 Compiler

On the D language's website [dlang.org](https://dlang.org), the most recent compiler version of the reference compiler DMD (Digital Mars D) can be downloaded and installed for several platforms.
See the [official downloads page](https://dlang.org/download.html) for more information.
On Windows, an alternative solution is [to use Chocolatey](https://chocolatey.org/packages/dmd).
On Intel-based Macs, an alternative solution is [to use Homebrew](https://formulae.brew.sh/formula/dmd).

### Other compilers
Besides the DMD reference compiler which uses its own backend, there are two other compilers that can be fetched through the dlang.org download section:

* [GDC](http://gdcproject.org/downloads) which uses the GCC backend
* [LDC](https://github.com/ldc-developers/ldc#installation) based on the LLVM backend

GDC and LDC aren't always at the most recent DMD frontend's versions but provide better optimization levels as well as support for other platforms like e.g. ARM.

See the wiki for [more information](https://wiki.dlang.org/Compilers).

### IDE support

There are also support for the D language in various IDEs, e.g. [VisualD](http://rainers.github.io/visuald/visuald/StartPage.html) for Visual Studio and [D plugin](https://plugins.jetbrains.com/plugin/7727?pr=clion) for IntelliJ's CLion.
See the wiki for [more information](https://wiki.dlang.org/IDEs).

### Prerequisite: DUB

[DUB](https://github.com/dlang/dub) is a build manager for D.

We recommend it as a way to simplify the process of running the tests, but it is still possible to run without DUB if you cannot or do not want to install it.

#### Windows

The [DUB website's download page](https://code.dlang.org/download) has a Windows installer.

#### MacOS

* The [DUB website's download page](https://code.dlang.org/download) has macOS binaries.
* For both Intel and Apple Silicon-based Macs, there is also [a Homebrew package available](https://formulae.brew.sh/formula/dub):

#### Linux

* The [DUB website's download page](https://code.dlang.org/download) has Linux binaries.
* Packages for various distributions are provided:
    * [ArchLinux](https://www.archlinux.org/packages/community/x86_64/dub/)
    * [Debian/Ubuntu](http://d-apt.sourceforge.net/)
    * [Gentoo](https://github.com/gentoo/dlang/tree/master/dev-util/dub)
    * [OpenSUSE](http://software.opensuse.org/download.html?project=devel%3Alanguages%3AD&package=dub)
