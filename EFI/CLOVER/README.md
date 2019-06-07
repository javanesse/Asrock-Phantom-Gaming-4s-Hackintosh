# Hal Apa saja yang terdapat pada config.plist

## 1. Fix AsRock Z390 BIOS DSDT Device(RTC) bug. If BIOS > 1.2
Fix AsRock Z390 BIOS DSDT Device(RTC) bug. If BIOS > 1.2 pada clover berguna untuk memperbaiki Real Time Clock yang merupakan bug pada mortherboard Asrock z390 mulai bios 1.2


## 2. DSDT
DSDT di isi dengan nama DSDT yang telah kita buat

## 3. PluginType

Penempatan PluginType berguna Untuk keperluan Native Power Management baik CPU maupun GPU

Cara Mengetahui Power Management CPU bisa di cek melalui aplikasi `IoReg`
* Apabila `x86PlatformPlugin` terload maka CPU Power Management berjalan

Cara Mengetahui Power Management GPU bisa di cek melalui aplikasi `IoReg`
* Apabila `AGP` terload maka CPU Power Management berjalan


# 4. Sort Order
Untuk me-load SSDT yang telah kita buat, maka kita perlu memasukkannya ke dalam list ini.
Sort order berisi seluruh `SSDT` yang ada pada partisi `EFI`

# 4. Automerge
berguna untuk merging SSDT-3.aml dan SSDT-3-xh_cfsd4.aml

- faktanya adalah,SSDT-3.aml merupakan SSDT-3-xh_cfsd4.aml yang telah di pilah untuk mengetahui USB 3 mana yang berjalan.
- DSDT-3.aml adalah copy an dari SSDT-3-xh_cfsd4.aml
- dengan kata lain, kita patching USB 3 pada SSDT-3.aml tanpa merubah code pada SSDT-3-xh_cfsd4.aml

Selebihnya hanyalah kosmetik
