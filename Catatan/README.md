# 1. Run Apps from Anywhere 

Run Apps from Anywhere is now missing from SysPrefs -> Security & Privacy -> General:

`sudo spctl --master-disable`

---

# 2. Modifier keys keyboard

```
control = command
option =option
command = control
```

---

# 3. Disable Hibernation

Be aware that hibernation (suspend to disk or S4 sleep) is not supported on hackintosh.

You should disable it:

```
sudo pmset -a hibernatemode 0
sudo rm /var/vm/sleepimage
sudo mkdir /var/vm/sleepimage
```

Always check your hibernatemode after updates and disable it. System updates tend to re-enable it, although the trick above (making sleepimage a directory) tends to help.

And it may be a good idea to disable the other hibernation related options:
Code:
```
sudo pmset -a standby 0
sudo pmset -a autopoweroff 0
```

[Sumber](https://www.tonymacx86.com/threads/guide-native-power-management-for-laptops.175801/)

---

# 4. Rebuild kernel cache

you must boot without cache using -f -F bootarg

`sudo kextcache -i /`

---

# 5. Reset NVRAM

To clear the values:

`sudo nvram -c`

To display the values:

`sudo nvram -p`

To display the values, including the SmUUID and other IDs stored there:

`sudo nvram -x -p`

---

# 6. Test NVRAM

From Terminal, I used the procedure to test for nvram ("sudo nvram TestVar=Hello", then reboot, then open Terminal again, "sudo nvram -p | grep TestVar") and found that nvram does not exist on this motherboard. This probably explains the inability to Reboot and Shutdown.

[Sumber](https://www.tonymacx86.com/threads/success-ongoing-status-of-designare-z390-with-i7-9700k.266065/)

---

# 7. Final Cut Pro X 10.14.6 Crash
lihat cara memperbaikinya [disini](FCP%20X%20Crash.md)

[Kembali ke menu utama](https://github.com/javanesse/Asrock-Phantom-Gaming-4s-Hackintosh/blob/master/README.md#langkah-instalasi)

---

# 8. verbose boot log
In Terminal (all data):
`log show --predicate "processID == 0" --debug`

In Terminal (only todays data):
`log show --predicate "processID == 0" --start $(date "+%Y-%m-%d") --debug`

---

# 9. Mojave Valid date to Install
Avoid `This Copy of the install MacOS xxx Application is damaged...`
Use Terminal
date 111111112018

---


# 10. Avoid You do not have permission to open the application “xxxxx.app” on big sur.
### Option 1:
1. Open Terminal. do a command : `codesign --force --deep --sign - /Applications/AppName.app`
2. Open your app

### Option 2:
1. [Instal brew](https://brew.sh/) via terminal
2. Install upx: `brew install upx` 
3. run command `sudo upx -d /Applications/my_app.app/Contents/MacOS/my_app` to your app
4. open your app

---

# 11. Avoid Unable to expand "xxx.zip" it is in an unsupported format. on big sur.

1. Open Terminal. do a command : `unzip xxx.zip`
2. Open home folder

---
