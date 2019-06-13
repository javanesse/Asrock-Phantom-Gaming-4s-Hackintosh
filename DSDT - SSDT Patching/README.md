# Patching ACPI/BIOS/DSDT/SSDT

Patching ACPI BIOS merupakan hal crusial dalam dunia Hackintosh.

Sama halnya dengan Windows, Agar dapat menjalankan Mac OS X dengan baik, maka, Mac OS X perlu mengenali hardware terlebih dahulu.
Namun Mac OS X sendiri punya cara berbeda dalam hal mengenali hardware perangkat. 

beberapa permasalahan yang terjadi apabila kita tidak melakukan patching ACPI pada hackintosh seperti VGA, Audio, USB tidak berjalan sebagaimana mestinya, dan masih banyak lagi.

Analoginya adalah, kita tidak mungkin menjalankan OS windows di smartphone padahal sama-sama memiliki porsesor, ram, storage, vga.
Sama halnya dengan Mac OS X yang tidak mungkin di jalankan oleh sembarang hardware. namun patching ini akan menjadikannya mungkin, dengan cara menyamar menjadi hardware Apple.

ACPI di sini merupakan susunan perintah yang menempel pada BIOS yang dapat di extract menjadi file `AML`. di antaranya DSDT dan SSDT.

DSDT dan SSDT inilah yang nantinya akan di manipulasi seakan-akan itu adalah hardware APPLE.

# Langkah-Langkah Patching ACPI

Adapun langkah-langkah dalam memanipulasi ACPI adalah sebagai berikut

1. Mengambil ACPI
2. Menyiapkan alat keperluan
3. Bongkar ACPI (decompile)
4. Bersihkan ACPI
5. Patch ACPI
6. Kemas ulang ACPI (re-compile)

## 1. Mengambil ACPI
Ada beberapa cara dalam mengextract ACPI, bisa melalui windows, linux, atau mac, atau clover.

Namun extract ACPI **sangat** di sarankan melalui clover bootloader dengan cara menekan tombol `F4` pada keyboard pada saat di menu utama clover bootloader.

Hal ini di karenakan ketika proses extract di bawah sistem operasi, maka akan terjadi kegagalan karena telah terkontaminasi oleh injector OS.

Sedangkan Clover hanya Bootloader yang akan mengekstrak file-file ACPI secara murni tanpa campur tangan sistem operasi.

seperti yang di utarakan [Rehabman](https://www.tonymacx86.com/threads/guide-patching-laptop-dsdt-ssdts.152573/)
```
Extracting with Clover F4 (recommended):

Extracting with Clover F4 is recommended, due to ease of extraction, and due to ease 
of comparison between ACPI/origin and ACPI/patched (for troubleshooting).

At the main Clover bootloader screen, you can press F4 and Clover 
will dump the native ACPI files to EFI/Clover/ACPI/origin. You can then 
access them after you boot OS X to disassemble them and patch. Note that some BIOS 
implementations reverse the function of Fn+F4 with F4, so when in doubt, 
press both Fn+F4 and F4. There is no feedback during or after the dump, 
just a slight delay as the files are written. The delay is more noticeable 
if they are being written to USB, as would be the case when booting from a Clover USB.
```
Sementara letak posisi ACPI yang baru saja di ambil/extract derada pada folder `EFI > Clover > ACPI > Origin` pada bootloader baik dari USB maupun Hardisk.

> Note: hapus file ACPI lama terlebih dahulu yang berada pada `EFI > Clover > ACPI > Origin` jika ada.
## 2. Menyiapkan alat keperluan
Adapun alat dan keperluan untuk melakukan patching adalah:
 - Koneksi Internet
 - MacIASL
 
MacIASL dapat di download [di sini](https://bitbucket.org/RehabMan/os-x-maciasl-patchmatic/downloads/)
Setelah di download, copy file iasl62 ke desktop
```
1. klik kanan aplikasi MacIASL
2. show package content
3. contents
4. macOS
5. iasl62
```
        
Lalu Ubah `iasl62` menjadi `iasl` dan copy file iasl tersebut ke /usr/bin dengan menggunakan terminal dengan perintah: 

```
sudo cp iasl /usr/bin
```
## 3. Bongkar ACPI (decompile)
Mengubah DSDT format AML menjadi DSL menggunakan Terminal

```
cd "to directory where you placed all SSDT/DSDT"
iasl -da -dl -fe refs.txt DSDT.aml SSDT*.aml
```

untuk ACPI BIOS lebih lama (sebelum skylake), tambahkan metode `-da` untuk melakukan decompile `iasl -da -dl DSDT.aml SSDT*.aml`, dan kadang butuh [refs.txt](https://www.tonymacx86.com/threads/guide-patching-laptop-dsdt-ssdts.152573/)


Namun untuk prosesor skylake keatas, ada perubahan

> Note: With newer ACPI sets (generally Skylake and later), the ACPI files have been compiled with a new enough version of iasl that embeds External opcodes in the resulting AML code. For these newer ACPI sets, no need for -da and especially not refs.txt as the refs.txt content here may conflict with the embedded External opcodes.

dari keterangan di atas menunjukkan bahwa mulai dari prosesor skylake, kita tidak perlu menggukanan `refs.txt` dan juga tanpa `-da`

artinya Khusus untuk `ACPI/BIOS` dari `Motherboard/prosesor` keluaran terbaru biasanya `Skylake` ke atas, proses decompile hanya menggunakan perintah `iasl -dl DSDT.aml SSDT*.aml` 

Adapun caranya adalah menggunakan aplikasi bawaan Mac OS X bernama terminal
> - saya asumsikan file-file DSDT dan SSDT berada di folder `origin` di desktop
> - Buka terminal, ketik `cd` lalu drag n drop folder `origin` yang ada di dekstop
> - ketik `iasl -dl DSDT.aml SSDT*.aml`

maka akan terbentuk file-file baru dalam folder tersebut dengan extensi baru yaitu `dsl`

file-file dsl inilah yang nantinya akan kita lakukan patching
## 4. Bersihkan ACPI
1. Buka file satu persatu menggunakan MacIASL
2. Tekan tombol compile,
> bila ada tanda merah, artinya terjadi error, perbaiki dulu kesalahan tersebut, karena bila terdapat error, maka tidak akan bisa di compile menjadi DSDT.aml

jika tidak ada error, silahkan lanjut ke langkah ke 5
## 5. Patch ACPI
hal paling utama yang wajib dilakukan dalam patching ACPI ini adalah menyelaraskan patching dari satu file ke file lainnya.

contoh kasus, ketika ingin mengubah metode `_DSM` menjadi `XDSM` pada salah satu file, maka harus di lakukan pula di **SELURUH** ACPI yang ada.

> untuk itu sebelum melakukan patching, ada sedikit trik untuk mencari metode/kata yang terdapat pada DSDT atau SSDT yang telah ada, yaitu dengan menggunakan terminal perintah `grep`. 

Contoh:
`
grep -l _DSM *.dsl
`

maka terminal akan menunjukkan file mana saja yang terdapat metode `_DSM`. hal ini di karenakan kita wajib mengubah seluruh file secara sinkronisasi. artinya, apabila dalam salah satu file terdapat metode `_DSM` sementara kita ingin mengubahnya menjadi `XDSM`, maka kita harus mengubah seluruh file yang ada kandungan metode `_DSM`.

---

> Alangkah lebih baik apabila kita membuat checklist apa saja yang ingin kita lakukan patching ke dalam file-file ACPI kita

> Alangkah lebih baik apabila mendokumentasikan setiap melakukan patching agar tidak tercampur aduk.

> Alangkah lebih baik pula jika setiap mengimplentasikan **SATU** buah patch, kemudian di lakukan pengetesan

---

### 5a. Patch Umum

```
Patch umum yang paling sering di butuhkan
- RENAME _DSM to XDSM
- External Fixes
- Fix _WAK Arg0 v2
- HPET Fix
- SMBUS Fix
- IRQ Fix
- RTC Fix
- OS Check Fix
- Fix Mutex with non-zero SyncLevel
- Add MCHC
- Add DTGP
- Skylake LPC
- Add Imei
```

#### Penjelasan Patch Umum

- RENAME _DSM to XDSM
> 	* Berguna agar metode _DSM dari ACPI bawaan BIOS, terabaikan oleh Mac OS X, tanpa harus menghapusnya

- External Fixes
> 	* berguna untuk menghapus semua `UnknownObj` yang tidak terpakai
> 	* Fix ini bisa di dapatkan di repo asus atau asrock

	```
	into_all all code_regex \/\*\sExternal\sreference\s\*\/\s+ removeall_matched;
	into definitionblock code_regex ,\sUnknownObj removeall_matched;
	```
	
- Fix _WAK Arg0 v2
> 	* Berguna agak mengenali panggilan untuk `WAKE` setelah komputer melakukan `SLEEP`

- HPET Fix
> 	* Jika mengalami `Kernel Panic` dengan pemberitahuan `No HPETs available...` atau tiba-tiba restart setelah `WAKE`, bisa jadi karena butuh patch ini.
> 	* Patch ini berguna untuk memastikan bahwa perangkat `HPET` selalu ada.
> 	* HPET fix untuk menghindari `Kernel Panic` dari `AppleIntelCPUPowerManagement`.

- SMBUS Fix
> 	* Memperbaiki `SMBUS` agar `AppleSMBusController.kext` dapat terload
> 	* Alternatif patch ini dapat menggunakan [SSDT-SMBUS.dsl](https://github.com/RehabMan/OS-X-Clover-Laptop-Config/blob/master/hotpatch/SSDT-SMBUS.dsl)

- IRQ Fix
> 	* Patch ini dapat memperbaiki audio yang tidak berfungsi dan juga berpengaruh pada `HPET`.
> 	* Gunakan patch ini jika memiliki masalah dengan `AppleHDA` yang sudah di patch (Di perlukan hampir di semua Laptop)
> 	* Atau ketika memiliki masalah dengan `HPET` (restart setelah wake)

- RTC Fix
> 	* RealTimeClock fix Berguna untuk memastikan agar `BIOS` tidak ter-reset setelah restart 

- OS Check Fix
> 	* Mensimulasikan versi windows untuk Darwin
> 	* Alternatif patch ini dapat menggunakan [SSDT-XOSI.dsl](https://github.com/RehabMan/OS-X-USB-Inject-All/blob/master/SSDT-XOSI.dsl)

- Fix Mutex with non-zero SyncLevel
> 	* Patch ini berguna untuk memperbaiki semua `Mutex objects` yang bernilai selain Zero atau 0(Nol)

- Add MCHC
> 	* Menambah perangkat MCHC yang Hilang

- Add DTGP
> 	* Menambah metode DTGP

- Haswell/Skylake LPC
> 	* Berguna agar `AppleLPC.kext` dapat terload. [Berikut patch untuk Skylake](https://github.com/RehabMan/Laptop-DSDT-Patch/blob/master/misc/misc_Skylake-LPC.txt)

- Add Imei
> 	* Jika dalam DSDT sudah terdapat IMEI/HECI/MEI, artinya tidak perlu megunakan patch ini

---
### 5b. Patch Spesifik
Pada Dasarnya perbaikan ini bertujuan untuk membuat perangkat/hardware kita bekerja dengan normal

sebelum menjurus ke masalah spesifik, ada baiknya kita mengubah nama perangkat dalam ACPI menjadi nama `native` untuk Mac OS x agar dapat di kenali dengan baik

Masalah			| Patch yang di gunakan	| Metode perubahan
------------------------|-----------------------|-----------------------
Ganti Nama Audio	| - Rename HDAS to HDEF	| - Manual
Ganti Nama VGA		| - Rename GFX0 to IGPU | - [IGPU] Rename GFX0 to IGPU
Ganti Nama SATA		| - Rename SAT0 to SATA | - Manual
Ganti Nama LAN		| - Rename GLAN to GIGE | - Manual
Ganti Nama USB 2	| - Rename EC0 to EC    | - Manual
Ganti Nama USB 3	| - Rename XHC1 to XHC  | - Manual
Ganti Nama IMEI		| - Rename HECI to IMEI | - Manual

> - Abaikan jika tidak ada
> - Apabila pada MacIASL tidak ada patch, maka kita hanya butuh mereplace secara manual. misal `HDAS to HDEF`, kita hanya butuh mencari kata `HDAS` kemudian merubahnya menjadi `HDEF`

Daftar Patch:
- [Patch USB 3.1 untuk chipset 300 series](https://github.com/javanesse/Asrock-Phantom-Gaming-4s-Hackintosh/blob/master/DSDT%20-%20SSDT%20Patching/Daftar%20Patch/Patch%20USB%203%20XHC%20300%20Series/README.md)
- [Patch GPU Intel UHD 630 Coffelake](https://github.com/javanesse/Asrock-Phantom-Gaming-4s-Hackintosh/tree/master/DSDT%20-%20SSDT%20Patching/Daftar%20Patch/Patch%20GPU%20UHD%20630%20Coffelake)
- [Patch Audio Realtek ALC 1220](https://github.com/javanesse/Asrock-Phantom-Gaming-4s-Hackintosh/tree/master/DSDT%20-%20SSDT%20Patching/Daftar%20Patch/Patch%20Motherboard%20Asrock%20Phantom%20Gaming%204s)
- [Patch PCI Device lists](https://github.com/javanesse/Asrock-Phantom-Gaming-4s-Hackintosh/tree/master/DSDT%20-%20SSDT%20Patching/Daftar%20Patch/Tambahan%20PCI%20devices%20dari%20Hackintool)

## 6. Kemas ulang ACPI (re-compile)
Proses re-compile ini sangatlah mudah, yaitu menyimpan file `dsl` yang telah kita lakukan patching menjadi `aml` kembali.

- Di aplikasi MacIASL `File > Save as > Acpi Machine Language Binary`
- Test dan jalankan file ACPI baru yang telah di lakukan patch, dengan cara menyimpannya di folder `EFI > CLOVER > ACPI > Patched` restart
