# Hal Apa saja yang terdapat pada config.plist

## Fix AsRock Z390 BIOS DSDT Device(RTC) bug. If BIOS > 1.2
Fix AsRock Z390 BIOS DSDT Device(RTC) bug. If BIOS > 1.2 pada clover berguna untuk memperbaiki Real Time Clock yang merupakan bug pada mortherboard Asrock z390 mulai bios 1.2


## DSDT
DSDT di isi dengan nama DSDT yang telah kita buat

## PluginType

Penempatan PluginType berguna Untuk keperluan Native Power Management baik CPU maupun GPU

Cara Mengetahui Power Management CPU bisa di cek melalui aplikasi `IoReg`
* Apabila `x86PlatformPlugin` terload maka CPU Power Management berjalan

Cara Mengetahui Power Management GPU bisa di cek melalui aplikasi `IoReg`
* Apabila `AGP` terload maka CPU Power Management berjalan


# Sort Order
Untuk me-load SSDT yang telah kita buat, maka kita perlu memasukkannya ke dalam list ini.
Sort order berisi seluruh `SSDT` yang ada pada partisi `EFI`

# DropTables DMAR
DropTables DMAR Signature untuk mengeliminasi permasalahan VT-d. [sumber](https://www.insanelymac.com/forum/topic/296726-what-they-are-for-these-flagsarguments/)

#DropTables MATS
MATS - with High Sierra on up this table is parsed, and can sometimes contain unprintable characters that can lead to a kernel panic. [sumber](https://hackintosh.gitbook.io/-r-hackintosh-vanilla-desktop-guide/config.plist-per-hardware/coffee-lake#drop-tables)

# Automerge
berguna untuk merging SSDT-3.aml dan SSDT-3-xh_cfsd4.aml

- faktanya adalah,SSDT-3.aml merupakan SSDT-3-xh_cfsd4.aml yang telah di pilah untuk mengetahui USB 3 mana yang berjalan.
- DSDT-3.aml adalah copy an dari SSDT-3-xh_cfsd4.aml
- dengan kata lain, kita patching USB 3 pada SSDT-3.aml tanpa merubah code pada SSDT-3-xh_cfsd4.aml

# Boot Arguments -v
perintah -v adalah untuk menampilkan booting secara verbose, berguna untuk mendiagnosis error secara visual saat booting. hapus ini bila ingin menampilkan hanya logo Apple.

# Slide=0
slide=0 is for boot.efi so it may be used only with Clover.

﻿The flag mean an offset to load kern﻿el and it is only way to boot by American Megatrend UEFI. [sumber](https://www.insanelymac.com/forum/topic/296726-what-they-are-for-these-flagsarguments/)

# Timeout 3
Fitur ini berguna agar komputer otomatis melanjutkan booting setelah hitungan 3 detik.

# NoEarlyProgress
kosmetik berguna untuk menyembunyikan tulisan-tulisan yang tidak penting saat melakukan booting pertama kali

# NeverHibernate
Seperti kita tahu bahwa Hackintosh tidak support fitur hibernasi, maka dari itu kita nonaktifkan fitur hibernasi dengan mencentang NeverHibernate

# NeverDoRecovery
fitur ini saya non aktifkan dengan cara mencentang karena tidak berpengaruh secara signifikan. fitur recovery hanya untuk melakukan recovery layaknya di windows yang notabene tidak pernah saya lakukan.


Selebihnya hanyalah kosmetik
