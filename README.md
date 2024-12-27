# FreeBSD ports of Logseq

A privacy-first, open-source platform for knowledge management and collaboration.

This is not an official release. For the upstream project or official releases, click [official github repo](https://github.com/logseq/logseq).

The official website: [logseq.com](https://logseq.com)

* * * 

## Use Logseq on FreeBSD?

**ATTENTION: This repo has only been tested on XFCE4 and rl9(Rocky Linux 9) linux userland. The runtime dependencies might not be fully found and listed since my computer is too old and slow to run `poudriere`.**

If you find anything wrong, feel free to open a PR(Push Request) or mail me directly. There is a big list of `ldd` output after this guide, it might be very useful. 

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

* * *

## `ldd` output of Logseq on FreeBSD

```
/compat/linux/opt/logseq/Logseq:
	libffmpeg.so => /compat/linux/opt/logseq/libffmpeg.so (0x1606990ae000)
	libdl.so.2 => not found (0)
	libpthread.so.0 => not found (0)
	libgobject-2.0.so.0 => /usr/local/lib/libgobject-2.0.so.0 (0x160699ba2000)
	libglib-2.0.so.0 => /usr/local/lib/libglib-2.0.so.0 (0x1606a54a1000)
	libgio-2.0.so.0 => /usr/local/lib/libgio-2.0.so.0 (0x1606a5dbf000)
	libnss3.so => /usr/local/lib/libnss3.so (0x1606a7986000)
	libnssutil3.so => /usr/local/lib/libnssutil3.so (0x1606a68ef000)
	libsmime3.so => /usr/local/lib/libsmime3.so (0x1606a6b76000)
	libnspr4.so => /usr/local/lib/libnspr4.so (0x1606a887b000)
	libatk-1.0.so.0 => /usr/local/lib/libatk-1.0.so.0 (0x1606a9a61000)
	libatk-bridge-2.0.so.0 => /usr/local/lib/libatk-bridge-2.0.so.0 (0x1606a8feb000)
	libcups.so.2 => /usr/local/lib/libcups.so.2 (0x1606aa65f000)
	libdbus-1.so.3 => /usr/local/lib/libdbus-1.so.3 (0x1606ac6e2000)
	libdrm.so.2 => /usr/local/lib/libdrm.so.2 (0x1606ab36b000)
	libgtk-3.so.0 => /usr/local/lib/libgtk-3.so.0 (0x1606ade00000)
	libpango-1.0.so.0 => /usr/local/lib/libpango-1.0.so.0 (0x1606abef9000)
	libcairo.so.2 => /usr/local/lib/libcairo.so.2 (0x1606acd80000)
	libX11.so.6 => /usr/local/lib/libX11.so.6 (0x1606af213000)
	libXcomposite.so.1 => /usr/local/lib/libXcomposite.so.1 (0x1606afd83000)
	libXdamage.so.1 => /usr/local/lib/libXdamage.so.1 (0x1606b03f5000)
	libXext.so.6 => /usr/local/lib/libXext.so.6 (0x1606b0826000)
	libXfixes.so.3 => /usr/local/lib/libXfixes.so.3 (0x1606b0d8d000)
	libXrandr.so.2 => /usr/local/lib/libXrandr.so.2 (0x1606b145f000)
	libgbm.so.1 => /usr/local/lib/libgbm.so.1 (0x1606b16c2000)
	libexpat.so.1 => /usr/local/lib/libexpat.so.1 (0x1606b1c88000)
	libxcb.so.1 => /usr/local/lib/libxcb.so.1 (0x1606b2c7c000)
	libxkbcommon.so.0 => /usr/local/lib/libxkbcommon.so.0 (0x1606b2d07000)
	libasound.so.2 => /usr/local/lib/libasound.so.2 (0x1606b3d8b000)
	libatspi.so.0 => /usr/local/lib/libatspi.so.0 (0x1606b3b8b000)
	libm.so.6 => not found (0)
	libgcc_s.so.1 => /lib/libgcc_s.so.1 (0x1606b4f74000)
	libc.so.6 => not found (0)
	ld-linux-x86-64.so.2 (0)
	libpthread.so.0 => not found (0)
	libm.so.6 => not found (0)
	libc.so.6 => not found (0)
	libffi.so.8 => /usr/local/lib/libffi.so.8 (0x1606b455d000)
	libc.so.7 => /lib/libc.so.7 (0x1606b5efd000)
	libiconv.so.2 => /usr/local/lib/libiconv.so.2 (0x1606b67b0000)
	libintl.so.8 => /usr/local/lib/libintl.so.8 (0x1606b7811000)
	libpcre2-8.so.0 => /usr/local/lib/libpcre2-8.so.0 (0x1606b8ba8000)
	libutil.so.9 => /lib/libutil.so.9 (0x1606b7f8e000)
	libthr.so.3 => /lib/libthr.so.3 (0x1606b9072000)
	libgmodule-2.0.so.0 => /usr/local/lib/libgmodule-2.0.so.0 (0x1606b9989000)
	libz.so.6 => /lib/libz.so.6 (0x1606b9a46000)
	libplc4.so => /usr/local/lib/libplc4.so (0x1606ba095000)
	libplds4.so => /usr/local/lib/libplds4.so (0x1606bbb26000)
	libdl.so.1 => /usr/lib/libdl.so.1 (0x1606bab70000)
	libavahi-common.so.3 => /usr/local/lib/libavahi-common.so.3 (0x1606bd472000)
	libavahi-client.so.3 => /usr/local/lib/libavahi-client.so.3 (0x1606bc741000)
	libgnutls.so.30 => /usr/local/lib/libgnutls.so.30 (0x1606bf11f000)
	libm.so.5 => /lib/libm.so.5 (0x1606bd742000)
	libcrypt.so.5 => /lib/libcrypt.so.5 (0x1606be5db000)
	libexecinfo.so.1 => /usr/lib/libexecinfo.so.1 (0x1606c010d000)
	libgdk-3.so.0 => /usr/local/lib/libgdk-3.so.0 (0x1606c0124000)
	libpangocairo-1.0.so.0 => /usr/local/lib/libpangocairo-1.0.so.0 (0x1606c0f25000)
	libharfbuzz.so.0 => /usr/local/lib/libharfbuzz.so.0 (0x1606c2565000)
	libpangoft2-1.0.so.0 => /usr/local/lib/libpangoft2-1.0.so.0 (0x1606c1d82000)
	libfontconfig.so.1 => /usr/local/lib/libfontconfig.so.1 (0x1606c2bab000)
	libfribidi.so.0 => /usr/local/lib/libfribidi.so.0 (0x1606c37a6000)
	libcairo-gobject.so.2 => /usr/local/lib/libcairo-gobject.so.2 (0x1606c4957000)
	libgdk_pixbuf-2.0.so.0 => /usr/local/lib/libgdk_pixbuf-2.0.so.0 (0x1606c4304000)
	libepoxy.so.0 => /usr/local/lib/libepoxy.so.0 (0x1606c5f48000)
	libXi.so.6 => /usr/local/lib/libXi.so.6 (0x1606c5664000)
	libthai.so.0 => /usr/local/lib/libthai.so.0 (0x1606c75d9000)
	libpixman-1.so.0 => /usr/local/lib/libpixman-1.so.0 (0x1606c699b000)
	libfreetype.so.6 => /usr/local/lib/libfreetype.so.6 (0x1606c86e1000)
	libEGL.so.1 => /usr/local/lib/libEGL.so.1 (0x1606c84f9000)
	libpng16.so.16 => /usr/local/lib/libpng16.so.16 (0x1606ca386000)
	libxcb-shm.so.0 => /usr/local/lib/libxcb-shm.so.0 (0x1606c92d7000)
	libxcb-render.so.0 => /usr/local/lib/libxcb-render.so.0 (0x1606c93c6000)
	libXrender.so.1 => /usr/local/lib/libXrender.so.1 (0x1606caf1c000)
	libGL.so.1 => /usr/local/lib/libGL.so.1 (0x1606cb599000)
	libwayland-server.so.0 => /usr/local/lib/libwayland-server.so.0 (0x1606cc145000)
	libXau.so.6 => /usr/local/lib/libXau.so.6 (0x1606cc687000)
	libXdmcp.so.6 => /usr/local/lib/libXdmcp.so.6 (0x1606cd501000)
	librt.so.1 => /lib/librt.so.1 (0x1606ce9fc000)
	libp11-kit.so.0 => /usr/local/lib/libp11-kit.so.0 (0x1606cd6da000)
	libidn2.so.0 => /usr/local/lib/libidn2.so.0 (0x1606cdda3000)
	libunistring.so.5 => /usr/local/lib/libunistring.so.5 (0x1606cf471000)
	libtasn1.so.6 => /usr/local/lib/libtasn1.so.6 (0x1606d0376000)
	libhogweed.so.6 => /usr/local/lib/libhogweed.so.6 (0x1606d0ecc000)
	libnettle.so.8 => /usr/local/lib/libnettle.so.8 (0x1606d1ed2000)
	libgmp.so.10 => /usr/local/lib/libgmp.so.10 (0x1606d2441000)
	libelf.so.2 => /lib/libelf.so.2 (0x1606d3117000)
	libwayland-client.so.0 => /usr/local/lib/libwayland-client.so.0 (0x1606d4b52000)
	libwayland-cursor.so.0 => /usr/local/lib/libwayland-cursor.so.0 (0x1606d3d90000)
	libwayland-egl.so.1 => /usr/local/lib/libwayland-egl.so.1 (0x1606d5489000)
	libXcursor.so.1 => /usr/local/lib/libXcursor.so.1 (0x1606d6027000)
	libXinerama.so.1 => /usr/local/lib/libXinerama.so.1 (0x1606d6f7f000)
	libgraphite2.so.3 => /usr/local/lib/libgraphite2.so.3 (0x1606d795c000)
	libdatrie.so.1 => /usr/local/lib/libdatrie.so.1 (0x1606d8b52000)
	libbz2.so.4 => /usr/lib/libbz2.so.4 (0x1606d7a51000)
	libbrotlidec.so.1 => /usr/local/lib/libbrotlidec.so.1 (0x1606d7eb0000)
	libGLdispatch.so.0 => /usr/local/lib/libGLdispatch.so.0 (0x1606d9aa7000)
	libGLX.so.0 => /usr/local/lib/libGLX.so.0 (0x1606da539000)
	libepoll-shim.so.0 => /usr/local/lib/libepoll-shim.so.0 (0x1606dbb4f000)
	libcxxrt.so.1 => /lib/libcxxrt.so.1 (0x1606db49c000)
	libbrotlicommon.so.1 => /usr/local/lib/libbrotlicommon.so.1 (0x1606dc52f000)
	[vdso] (0x1606985dd000)
```