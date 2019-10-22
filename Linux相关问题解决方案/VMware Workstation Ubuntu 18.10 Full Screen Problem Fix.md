# VMware Workstation Ubuntu 18.10 Full Screen Problem Fix

Install:

```
sudo apt purge open-vm-tools
sudo apt upgrade
sudo apt install open-vm-tools open-vm-tools-desktop
```

Edit:

```
/etc/systemd/system/multi-user.target.wants/open-vm-tools.service
```

Add these lines to the end of the "Unit" section:

```
Requires=graphical.target
After=graphical.target
```

Reboot.

Thanks to Robert G @ askubuntu, and for your reference:
<https://askubuntu.com/questions/1085621/vmware-workstation-ubuntu-18-10-full-screen-problem>