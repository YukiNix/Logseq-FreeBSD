# FreeBSD ports of Logseq

A privacy-first, open-source platform for knowledge management and collaboration.

This is not an official release. For the upstream project or official releases, click [official github repo](https://github.com/logseq/logseq).

The official website: [logseq.com](https://logseq.com)

* * * 

## Use Logseq on FreeBSD?

**ATTENTION: This repo has only been tested on XFCE4 and rl9(Rocky Linux 9) linux userland. The runtime dependencies might not be fully found and listed since my computer is too old and slow to run `poudriere`.**

If you find anything wrong, feel free to open a PR(Push Request) or mail me directly. There is a big list of `ldd` output follow this guide, it might be very useful. 

For convinience, I denote [FreeBSD HandBook](https://docs.freebsd.org/en/books/handbook/) as "the Handbook", which is the most handfull guide for me.

For developers, it is **highly** recommand to this ports by [jails](https://wiki.freebsd.org/Jails) and [poudriere](https://wiki.freebsd.org/VladimirKrstulja/Guides/Poudriere). For more details, please follow the HandBook chapter [17.Jails and Containers](https://docs.freebsd.org/en/books/handbook/jails/) and [FreeBSD Porter's Handbook](https://docs.freebsd.org/en/books/porters-handbook/) chapter [10.7.poudrier](https://docs.freebsd.org/en/books/porters-handbook/testing/#testing-poudriere).


#### 1. Graphical Interface

To launch Logseq on FreeBSD, you need a graphical interface. **This step is highly depends on the machine and your mind.** 

If you do not known how to do it, please follow the Handbook chapters [5.X11](https://docs.freebsd.org/en/books/handbook/x11/), [6.wayland](https://docs.freebsd.org/en/books/handbook/wayland/) and [8.Desktop Enviroments](https://docs.freebsd.org/en/books/handbook/desktop/).

#### 2. Linux Binary Compatibility

Linux Binary Compatibility is also needed at present time. The details can be found in the Handbook chapter [12.Linux Binary Compatibility](https://docs.freebsd.org/en/books/handbook/linuxemu/).

Here is a brief summarize, root privilege might be needed.
 
To enable the [Linux ABI](https://man.freebsd.org/cgi/man.cgi?query=linux&apropos=0&sektion=0&manpath=FreeBSD+14.2-RELEASE+and+Ports&arch=default&format=html) at boot time:
`sysrc linux_enable="YES"`

Once enabled, it can be started without rebooting by: `service linux start`

I recommend to use Rocky Linux 9 userland (which is the newest userland in [pkg](https://man.freebsd.org/cgi/man.cgi?pkg)): `pkg install linux_base-rl9` 

The userland of Debian and Cenos 7 should also work, but have not been tested. For details, please follow the Handbook chapter [12.3.Linux userlands](https://docs.freebsd.org/en/books/handbook/linuxemu/#linux-userlands).

The chapter [12.4.Advanced topics](https://docs.freebsd.org/en/books/handbook/linuxemu/#linuxemu-advanced) is highly recommand if you have something wrong when launch Logseq on FreeBSD.

#### 3. Fetch this ports

[git](https://wiki.freebsd.org/Git) is recommanded to to get this ports. It can be installed by [pkg](https://man.freebsd.org/cgi/man.cgi?pkg), root privilege might be requested: `pkg update && pkg install git`.

`git clone https://github.com/YukiNix/Logseq-FreeBSD.git`

If you do not want to use [git](https://wiki.freebsd.org/Git), there is also a [tarball](https://github.com/YukiNix/Logseq-FreeBSD/archive/refs/heads/main.zip) of this repo can be downloaded. [unzip](https://man.freebsd.org/cgi/man.cgi?query=unzip&sektion=1) might be needed to extract it.
To fit the following guide, you can name the folder extracted "Logseq-FreeBSD".

Step into this ports directory by `cd Logseq-FreeBSD`

#### 4. Make and install

If you are confused about ports system of FreeBSD, please follow the Handbook chapter [4.5.Using the ports collection](https://docs.freebsd.org/en/books/handbook/ports/#ports-using).

**ATTENTION: This ports has not been a part of the official FreeBSD ports, you can not find it in $/usr/ports$".** Please make it in the directory $Logseq-FreeBSD$.

Here is a brief summarize, root privilige might be needed in step "make install".

Make every right in [StageDir](https://wiki.freebsd.org/Ports/StageDir): `make`

Install every into system dirs: `make install`

Clean all temperary files: `make clean`

#### 5. Enjoy Logseq on your prefered system

To launch Logseq from Terminal: `logseq`. 

By this way, you can get more information from the program's output. It is usefull for debugging.

There is also a entry point in menu of your desktop enviroment (If existed).

Enjoy it.

* * * 

## 🤔 Why Logseq?

[Logseq](https://logseq.com) is a **knowledge management** and **collaboration** platform. It focuses on **privacy**, **longevity**, and [**user control**](https://www.gnu.org/philosophy/free-sw.en.html). Logseq offers a range of **powerful tools** for **knowledge management**, **collaboration**, **PDF annotation**, and **task management** with support for multiple file formats, including **Markdown** and **Org-mode**, and **various features** for organizing and structuring your notes.

Logseq's **Whiteboard** feature lets you organize your knowledge and ideas using a spatial **canvas** with **shapes**, **drawings**, **website embeds**, and **connectors**. You can **visually group** and **link** your **notes** and external media (such as **videos** and **images**), enabling visual thinkers to compose, remix, **annotate**, and connect content from their knowledge base and emerging thoughts in a new way.

In addition to its core features, Logseq has a growing ecosystem of **plugins** and **themes** that enable a wide range of workflows and **customization** options. **Mobile apps** are also available, providing access to most of the features of the desktop application. Whether you're a student, a professional, or anyone who values a clear and organized approach to managing your ideas and notes, Logseq is an excellent choice for anyone looking to improve their productivity and streamline their workflow.

![logseq-demo](https://user-images.githubusercontent.com/25513724/221387376-4dc419c2-0d0a-460c-a920-2d211e78b456.gif)

<a href="https://github.com/logseq/logseq/releases/latest/">
        <img src="https://img.shields.io/badge/Download_Logseq-100000?style=for-the-badge&logo=flatpak&logoColor=white&labelColor=002b36&color=85c8c8"
            align="right"
            alt="Download Logseq"/></a>
