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

[Kembali ke menu utama](https://github.com/javanesse/Asrock-Phantom-Gaming-4s-Hackintosh#8-troubleshoot-dan-patching)