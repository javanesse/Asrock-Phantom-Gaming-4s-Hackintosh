

Sumber|
------|
[8700 gigabyte](https://www.tonymacx86.com/threads/success-8700k-gigabyte-z370-hd3p-uhd-graphics-630-macos-high-sierra-mojave.239402/)|
[RehabMan - Tonymacx86 ](https://www.tonymacx86.com/threads/guide-patching-laptop-dsdt-ssdts.152573/)|

Versi OS         | smbios
-----------------|--------------
Mojave 10.4.5    | iMac 19.2 



## 1. Metode pengambilan ACPI
### menggunakan clover bootloader dengan cara memencet tombol F4
Extracting with Clover F4 (recommended):

Extracting with Clover F4 is recommended, due to ease of extraction, and due to ease of comparison between ACPI/origin and ACPI/patched (for troubleshooting).

At the main Clover bootloader screen, you can press F4 and Clover will dump the native ACPI files to **EFI/Clover/ACPI/origin**. You can then access them after you boot OS X to disassemble them and patch. Note that some BIOS implementations reverse the function of Fn+F4 with F4, so when in doubt, press both Fn+F4 and F4. There is no feedback during or after the dump, just a slight delay as the files are written. The delay is more noticeable if they are being written to USB, as would be the case when booting from a Clover USB.

## 2. Menyiapkan Tool untuk membongkar ACPI
### MacIASL
MacIASL dapat di download [di sini](https://bitbucket.org/RehabMan/os-x-maciasl-patchmatic/downloads/)
Setelah di download, copy file iasl62 ke desktop
```
1. klik kanan aplikasi MacIASL
2. show package content
3. contents
4. macOS
5. iasl62
```
        
Lalu Ubah iasl62 menjadi iasl dan copy file iasl tersebut ke /usr/bin dengan menggunakan terminal dengan perintah: 

> sudo cp iasl /usr/bin


## 3. Membongkar/disassembly ACPI/DSDT
### Membongkar DSDT menggunakan Terminal

```
cd "to directory where you placed all SSDT/DSDT"
iasl -dl DSDT.aml SSDT*.aml
iasl -dl DSDT.aml SSDT*.aml
```

> Note: With newer ACPI sets (generally Skylake and later), the ACPI files have been compiled with a new enough version of iasl that embeds External opcodes in the resulting AML code. For these newer ACPI sets, no need for -da and especially not refs.txt as the refs.txt content here may conflict with the embedded External opcodes.

dari keterangan di atas menunjukkan bahwa mulai dari prosesor skylake, kita tidak perlu menggukanan `refs.txt` dan juga tanpa `-da`

patches only DSDT from maciasl
"RENAME _DSM to XDM"
"Fix _WAK Arg0 v2"
"HPET Fix"
"SMBUS Fix"
"IRQ Fix"
"RTC Fix"
"OS Check Fix"
"Fix Mutex with non-zero SyncLevel"
"Add MCHC"

Search All DSDT and SSDT and replace : grep -l _DSM *.dsl
"RENAME _DSM to XDM"
"HECI to IMEI"
"SAT0 to SATA"
"HDAS to HDEF"
"GFX0 to IGPU"
