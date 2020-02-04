---
layout: tutorial_hands_on

title: "01 Linux installation and training material"

questions:
  - "How to get started in Linux?"

objectives:
  - "get familiar with Linux"
  - "learn how to install it on your computer"
  - "learn how to access the training environment in the cloud"

time_estimation: "10m"
key_points:
  - "What is the Linux OS"
  - "What are possible installation methods"
  - "Where can I find command line information"

contributors:
  - chdeb
---

## What is Linux?
Linux is a very popular operating system in bioinformatics. In this training you will learn why that is and how it can help you with your bioinformatics analysis. After this training you will be able to:
- install software on Linux
- use command line to run tools
- use command line to handle files
- write small scripts to automate your analysis

## Linux installation
### Live modus
Want to test a Linux distribution? Follow this procedure: 
- Grab an USB key and put your Linux distribution (e.g. Ubuntu) on it. 
- Boot your computer from that bootable USB key, and you have a full linux OS to play around with. This 'live modus' is an easy way to test the new stuff linux has to offer. 
- Before you test anything else, check if your hardware works (printer, sound,...) and check internet connection. 
- Secondly, do you like the desktop environment? Does it suit your needs? Play around and test. 
Done testing? Just reboot your computer, remove the USB key, and the original operating system will start up again as if nothing has happened...

### Virtual machine
Go to <https://www.virtualbox.org> and choose Downloads. Download the correct installer for your platform and install VirtualBox on your computer.
Sometimes VirtualBox displays errors when starting. Or trying VirtualBox for the first time, a virtual machine might not start. These problems might be related to not having virtualization enabled on your CPU.
All the latest processors and motherboards support virtualization technology (vt-x/amd-v). It many cases, VirtualBox requires this to be enabled. To do so, you have to reboot your computer, and get into the BIOS menu. In the BIOS menu, you should enable virtualization. Where this setting is located is different between computers, so check your hardware vendor for the BIOS options, or browse around in your BIOS menu until you find it. Most of the times it is named in a decent way. Enable the option, and boot your computer.

We need to download an .iso file, which is a (binary) copy of an installation DVD containing your distribution of choice. You can find it in the downloads section of the distribution's web page. You can download it using a direct download, depending on your preference and the options offered by the distribution's web page.
You can run Linux in 'live modus' (see instructions above) and install it directly on your virtual machine. Afterwards you have to reboot your virtual machine to get out of the live modus.

### Dual boot
Multi-booting allows more than one operating system to reside on one computer, for example if you have a primary operating system and an alternate system that you use less frequently. Another reason for multi-booting can be to investigate or test a new operating system without switching completely. Multi-booting allows a new operating system to configure all applications needed, and migrate data before removing the old operating system.

## Training material
[slides](http://data.bits.vib.be/pub/trainingen/Linux/Command_line_2019.pdf)

On the training there is a Linux Ubuntu installation available on a cloud environment. To access Linux we use Google Chrome and the 'VNC Viewer for Google Chrome' application.
When you launch the application, you have to enter an IP address, this will be mentioned on the training.

### Additional information
- [Linux Beginner's Cheat page](https://wiki.bits.vib.be/index.php/Linux_Beginner%27s_Cheat_page)
- [The practical command line cheat sheet](https://wiki.bits.vib.be/index.php/The_practical_command_line_cheat_sheet)
- [AWK](https://wiki.bits.vib.be/index.php/AWK)
- [Terminal keyboard shortcuts](http://data.bits.vib.be/pub/trainingen/cheat-sheets/Bash_Keyboard_Shortcuts.pdf)