# Patching ACPI/DSDT Asrock Phantom Gaming 4s


![Jv Screenshot](https://github.com/javanesse/Asrock-Phantom-Gaming-4s-Hackintosh/blob/master/Images/System%20ScreenShoot/About%20This%20Mac%20Intel%20UHD%20630.png)

Nama              | Keterangan
------------------|--------------
Prosesor          | Intel Core i7 8700 (Bukan K)
Motherboad        | Asrock Phantom Gaming 4s
Versi OS          | Mojave 10.4.5
SMBios            | iMac 19.2 



## 1. Metode pengambilan ACPI
### menggunakan clover bootloader dengan cara memencet tombol F4
Extracting with Clover F4 (recommended):

Extracting with Clover F4 is recommended, due to ease of extraction, and due to ease of comparison between ACPI/origin and ACPI/patched (for troubleshooting).

At the main Clover bootloader screen, you can press F4 and Clover will dump the native ACPI files to **EFI/Clover/ACPI/origin**. You can then access them after you boot OS X to disassemble them and patch. Note that some BIOS implementations reverse the function of Fn+F4 with F4, so when in doubt, press both Fn+F4 and F4. There is no feedback during or after the dump, just a slight delay as the files are written. The delay is more noticeable if they are being written to USB, as would be the case when booting from a Clover USB.

Hapus semua file ACPI yang tidak berawalan dengan DSDT dan SSDT.

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

```
sudo cp iasl /usr/bin
```

## 3. Membongkar/disassembly ACPI/DSDT
### Mengubah DSDT format AML menjadi DSL menggunakan Terminal

```
cd "to directory where you placed all SSDT/DSDT"
iasl -da -dl -fe refs.txt DSDT.aml SSDT*.aml
```
Namun untuk prosesor skylake keatas, ada perubahan

> Note: With newer ACPI sets (generally Skylake and later), the ACPI files have been compiled with a new enough version of iasl that embeds External opcodes in the resulting AML code. For these newer ACPI sets, no need for -da and especially not refs.txt as the refs.txt content here may conflict with the embedded External opcodes.

dari keterangan di atas menunjukkan bahwa mulai dari prosesor skylake, kita tidak perlu menggukanan `refs.txt` dan juga tanpa `-da`

yang berarti untuk mengubah DSDT dan SSDT **AML** menjadi **DSL** di terminal hanya menggunakan perintah:
```
iasl -dl DSDT.aml SSDT*.aml
```

## 4. Patching ACPI
### Membereskan error yang ada pada ACPI

hal paling pertama sekali yang wajib dilakukan dalam patching ACPI ini adalah mengubah metode `_DSM` menjadi `XDSM` di **SELURUH** ACPI yang ada.

dan sebelum melakukan patching, ada sedikit trik untuk mencari metode/kata yang terdapat pada DSDT atau SSDT yang telah ada, yaitu dengan menggunakan terminal perintah `grep`. Contoh:

`
grep -l GFX0 *.dsl
`

maka terminal akan menunjukkan file mana saja yang terdapat metode `GFX0`. hal ini di karenakan kita wajib mengubah seluruh file secara sinkronisasi. artinya, apabila dalam beberapa file terdapat `GFX0` dan kita ingin mengubahnya menjadi `IGPU`, maka kita harus mengubah semuanya.


```
patch DSDT dari maciasl
- RENAME _DSM to XDSM
- Fix _WAK Arg0 v2
- HPET Fix
- SMBUS Fix
- IRQ Fix
- RTC Fix
- OS Check Fix
- Fix Mutex with non-zero SyncLevel
- Add MCHC
```

```
Wajib cari di semua DSDT dan SSDT kemudian replace
* RENAME _DSM to XDM
* HECI to IMEI
* SAT0 to SATA
* HDAS to HDEF
* GFX0 to IGPU
```

Apabila pada MacIASL tidak ada patch, maka kita hanya butuh mereplace secara manual. misal `HDAS to HDEF`, kita hanya butuh mencari kata `HDAS` kemudian merubahnya menjadi `HDEF`

## 5. Mengexport file
### Menyimpan dan mengeksport file menjadi AML

Pastikan terlebih dahulu bahwa tidak ada satupun Error pada file ACPI. warning tidak menjadi soal, tapi error adalah hal fatal.


Setelah melakukan patching, tentunya kita harus menyimpannya, kemudian save as `ACPI MACHINE LANGUAGE BINARY` atau `AML`.
Setelah semua file tersimpan dan menjadi file `AML`, kemudian letakkan seluruh file yang berformat `AML` di dalam partisi `EFI > Clover > Patched`.


Sumber|
------|
[8700 gigabyte](https://www.tonymacx86.com/threads/success-8700k-gigabyte-z370-hd3p-uhd-graphics-630-macos-high-sierra-mojave.239402/)|
[RehabMan - Tonymacx86 ](https://www.tonymacx86.com/threads/guide-patching-laptop-dsdt-ssdts.152573/)|