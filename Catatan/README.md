# Run Apps from Anywhere 

Run Apps from Anywhere is now missing from SysPrefs -> Security & Privacy -> General:

`sudo spctl --master-disable`

---

# Modifier keys keyboard

```
control = command
option =option
command = control
```

---

# Disable Hibernation

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
# Rebuild KextCache BigSur


```
sudo chown -R root:wheel /System/Library/Extensions/
sudo chmod -R 755 /System/Library/Extensions/
sudo kmutil install --update-all
sudo kcditto
```

---

# Reset NVRAM

To clear the values:

`sudo nvram -c`

To display the values:

`sudo nvram -p`

To display the values, including the SmUUID and other IDs stored there:

`sudo nvram -x -p`

---

# Test NVRAM

From Terminal, I used the procedure to test for nvram ("sudo nvram TestVar=Hello", then reboot, then open Terminal again, "sudo nvram -p | grep TestVar") and found that nvram does not exist on this motherboard. This probably explains the inability to Reboot and Shutdown.

[Sumber](https://www.tonymacx86.com/threads/success-ongoing-status-of-designare-z390-with-i7-9700k.266065/)

---

# verbose boot log
In Terminal (all data):
`log show --predicate "processID == 0" --debug`

In Terminal (only todays data):
`log show --predicate "processID == 0" --start $(date "+%Y-%m-%d") --debug`

---

# Mojave Valid date to Install
Avoid `This Copy of the install MacOS xxx Application is damaged...`
Use Terminal
date 111111112018

---


# Avoid You do not have permission to open the application “xxxxx.app” on big sur.
### Option 1:
1. Open Terminal. do a command : `codesign --force --deep --sign - /Applications/AppName.app`
2. Open your app

### Option 2:
1. Open Terminal. do a command : `sudo chmod -R 755 /Applications/AppName.app`
2. Open your app


### Option 3:
1. [Instal brew](https://brew.sh/) via terminal
2. Install upx: `brew install upx` 
3. run command `sudo upx -d /Applications/my_app.app/Contents/MacOS/my_app` to your app
4. open your app

---

# Avoid Unable to expand "xxx.zip" it is in an unsupported format. on big sur.

1. Open Terminal. do a command : `unzip xxx.zip`
2. Open home folder

---

# Backup Logic Pro Additional Sound Library Content Installer

Seperti kita tahu bahwa file Additional Content Installer memiliki ukuran yang besar. namun hasil download logic pro tersimpan secara tersembunyi. Ketika kita melakukan download, dan setelah download selesai, maka akan otomatis melakukan instalasi.
Sayangnya, setelah instalasi, file-file tersebut akan otomatis terhapus, sehingga ketika kita melakukan instal ulang, kita di paksa untuk melakukan download ulang fil-file tersebut kembali.

Beruntung kita dapat melakukan backup file-file installer tersebut. Namun hal ini harus sebelum file yang telah kita download tersebut terinstall.

1. download Aditional Sound Library
2. Ketika download selesai, maka installer minta password. `JANGAN MASUKKAN PASSWORD TERLEBIH DAHULU`
3. Buka `Finder`, pilih menu `Go`, pilih menu `Go to Folder` ketik `/private/var/folders/`
4. Cari dan buka folder `com.apple.MusicApps`, Hasil download akan tersimpan disini.
5. Copy folder `com.apple.MusicApps` ke hardisk lain untuk instalasi selanjutnya di kemudian hari tanpa perlu download ulang.
6. Setelah tercopy, silahkan lakukan instalasi dengan memasukkan Password yang di minta oleh logic pro

[Source 1](https://www.youtube.com/watch?v=4ZEjC1pDJ9Q)

[Source 2](https://www.youtube.com/watch?v=6ncYUNLoTyM)

---

# Mengatasi could not be executed because you do not have appropriate access privileges

1. buka terminal, Ketik : `chmod u+x "path-to-file"`
- Contoh:`chmod u+x /Users/Javanesse/Desktop/script.command`

---
# Mac Slow After Wake from sleep
Put your computer to sleep, wake it up, open Terminal.app and run:

Code:
log show --last 5m | grep TSC

if you see messages like:
Unsynchronized TSC for CPU ...

the problem is TSC Sync

theres a bunch of option to fix this. for example:
1. you need this kext:
https://bitbucket.org/RehabMan/VoodooTSCSync/downloads/

2. or you can read this:
https://dortania.github.io/OpenCore-Post-Install/universal/sleep.html#tsc

3. or search for another solution

---
# Embeded Controller
To boot 10.15 two things needs to be taken care of:
If you have an EC device with ID PNP0C09 in your DSDT then macOS might get stuck while booting at the initial stage. To fix that you need to make sure your EC device is disabled by making it return status Zero. You can use a custom [SSDT-EC](https://dortania.github.io/Getting-Started-With-ACPI/Universal/ec-fix.html)

---
