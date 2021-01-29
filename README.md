# Asrock-Phantom-Gaming-4s-Hackintosh
This Repo for Asrock Phantom Gaming 4s Hackintosh with intel core i7 8700 running Mojave 10.14.5


![Mojave 10.4.5](/Images/System%20ScreenShoot/About%20This%20Mac%20Intel%20UHD%20630.png)

# MUKADIMAH
> SATU HAL UTAMA YANG PERLU DI PERHATIKAN DALAM TUTORIAL DISINI ADALAH, PROSES YANG KELIHATAN RUMIT PADAHAL MUDAH SEKALI APABILA DI PRAKTEKKAN. JANGAN TAKUT UNTUK MENCOBA.

# Note!!! Tutorial ini hanya untuk digunakan apabila ingin Bootloader Clover

> Untuk menggunakan OpenCore bahkan akan lebih mudah, langsung masuk ke folder [BIGSUR UPDATE](https://github.com/javanesse/Asrock-Phantom-Gaming-4s-Hackintosh/tree/master/BIG%20SUR%20UPDATE).

> Namun untuk mempelajari bagaimana sistem kerja sebuah Hackintosh lebih mendalam, baiknya menggunakan tutorial ini terlebih dahulu.

Ini adalah Langkah membuat hackintosh. Pada contoh ini, saya menggunakan motherboard Asrock Phantom Gaming 4s Hackintosh dengan prosesor intel core i7 8700

## Untuk hardware lain pun dapat mengikuti tutorial ini.

Hal umum yang di perlukan dalam instalasi Hackintosh pada dasarnya *sama* dengan instalasi microsoft windows pada umumnya, hanya saja di tambah dengan 1 *"software"*  bernama bootloader.

Analogi proses booting Windows:
- Komputer meyala
- Logo BIOS muncul
- Masuk Windows

Analogi booting Hackintosh:
- Komputer menyala
- Logo Bios muncul
- Bootloader(Emulasi Bios Mac)
- Masuk Mac OS X

Produsen hardware tidak meyediakan driver (kexts) untuk sistem operasi Mac OSX, maka dari itu kita perlu melakukan patching agar driver mac dapat mengenali jenis hardware kita.

> Apa akibatnya apabila hackintosh tidak di lakukan patching? Fungsi harware kurang maksimal. sama halnya ketika WINDOWS apabila tidak di install driver, seperti VGA, Audio, USB 3, Cardreader, Lan, Wifi.

Repo ini sendiri boleh di katakan ini adalah repo driver (kext) untuk mac osx khusus hardware-hardware yang ada pada spesifikasi. dengan kata lain, jika spesifikasi komputer Anda kebetulan sama dengan komputer ini, maka langkah instalasi hackintosh Anda akan semakin mudah karena sudah tersedia driver (kext) untuk hardware jenis ini.

Namun disini ada beberapa referensi tutorial untuk melakukan patching hardware-hardware lain.


## Hardware yang saya gunakan

Nama                | Merk               | Seri
--------------------|--------------------|--------------------
Prosesor            | Intel              | [core i7 8700](https://ark.intel.com/content/www/us/en/ark/products/126686/intel-core-i7-8700-processor-12m-cache-up-to-4-60-ghz.html)
Motherboard         | Asrock             | [Phantom Gaming 4s](https://www.asrock.com/MB/Intel/Z390%20Phantom%20Gaming%204S/index.asp)
Ram                 | Team               | [T-force Delta 16GB](https://www.teamgroupinc.com/en/product/delta-rgb-ddr4)
Storage             | Sandisk            | [SSD Plus 250GB](https://www.sandisk.id/home/ssd/ssd-plus)
Wireless            | TPLINK             | [TL WN781nd v.2](https://www.tp-link.com/id/home-networking/adapter/tl-wn781nd/)
Heatsink            | Deepcool           | [Gammax 300](http://www.deepcool.com/product/cpucooler/2013-12/7_481.shtml)
Power Supply        | Power Up           | [Corsair VS650 — 650 Watt 80 PLUS](https://www.corsair.com/eu/en/Categories/Products/Power-Supply-Units/vs-series-config-2018/p/CP-9020172-EU)
Casing              | Power Up           | [Raptor 1707](https://www.bukalapak.com/p/komputer/aksesoris-226/aksesoris-lainnya-241/mt3i5k-jual-power-up-silver-strike-1707-black-no-psu)
Monitor             | Samsung            | [Curved Monitor 24" C24F390FHE](https://www.samsung.com/id/monitors/curved/curved-24-inch-lc24f390fhexxd/)
GPU                 | Gigabyte           | [RX Vega 64 8GB](https://www.gigabyte.com/id/Graphics-Card/GV-RXVEGA64-8GD-B)

Nama        | Keterangan
------------|------------
OS          | Mac OS X
Versi       | 10.14.5
CodeName    | Mojave
Smbios      | iMac 19,1


Adapun yang perlu di perhatikan untuk driver(kext) yang ada disini **HANYA** untuk `Motherboard` dan `CPU` yang sama. selebihnya terserah pilihan Anda. Dengan kata lain, bila menggunakan `Motherboard` dan `CPU` yang sama, maka dapat menggunakan driver yang ada di sini, namun apabila spesifikasi hardware berbeda, silahkan cari referensi menggunakan google untuk cari tahu tentang hardware Anda. Contoh, Motherboard `Gygabyte`, konfigurasinya akan sedikit berbeda, mengingat berbeda pabrikan. Contoh lain, Driver(Kext) WIFI TPLink akan berbeda dengan Tenda.

## Langkah Instalasi
1. [Persiapan hardware](#1-persiapan-hardware)
2. [Download OS](#2-download-os)
3. [Membuat bootable USB](#3-membuat-bootable-usb)
4. [Mengatur settingan BIOS](#4-mengatur-settingan-bios)
5. [Instalasi](#5-instalasi)
6. [Konfigurasi Pasca Install/Post Install](#6-konfigurasi)
7. [Target Operasi dan Checklist](#7-target-operasi-dan-checklist)
8. [Troubleshoot dan Patching](#8-troubleshoot-dan-patching)

### 1. Persiapan hardware
Seperti yang saya utarakan di atas, bahwasannya persiapan hardware sebelum melakukan instalasi ini, kita fokus pada `Motherboard` dan `CPU`. Selebihnya terserah pilihan Anda.

Dan tentu saja **sebuah USB Flashdisk** minimal berukuran `16GB` untuk membuat file instalasi.

> **KHUSUS** bagi yang pertama kali ingin melakukan instalasi hackintosh, karena pembuatan `Bootable USB` hanya bisa di lakukan melalui MAC OSX, maka dengan sangat menyesal saya katakan saya tidak akan membuat tutorialnya. namun Anda dapat membuat hackintosh melalui windows dengan cara mendownload Distro hackintosh. salah satunya yang lengkap dengan link download beserta tutorialnya, ada di [di sini](https://olarila.com/forum/viewtopic.php?f=50&t=8685). tutorial dalam bahasa inggris, gunakan google translate apabila kurang mengerti.


> atau cara paling mudah, yaitu membuat bootable USB dengan perangkat apple kepunyaan teman, saudara atau siapa saja.


Lanjut ke topik,
Untuk patching hardware lain selain **Asrock Phantom Gaming 4s**, metode yang di gunakan adalah sama persis, hanya saja kita butuh `patch` yang berbeda.
adapun cara membuat `patch` untuk hardware lain, silahkan langsung lompat ke langkah [8. Troubleshoot dan patching](#8-troubleshoot-dan-patching)


### 2. Download OS
File Mac OSX Mojave 10.14.5 yang saya download adalah menggunakan [torrent](https://mac-torrent-download.net/macos-mojave-10-14-5-18f132/) dan sejauh ini berhasil, namun sangat di anjurkan untuk mendownload secara langsung dari AppStore 

### 3. Membuat bootable USB
##### 3a. Membuat Bootable USB itu sendiri
[![Membuat Bootable USB](https://img.youtube.com/vi/rCfGxY-nRdk/0.jpg)](https://www.youtube.com/watch?v=rCfGxY-nRdk)
      
##### 3b. Install Bootloader
[![Install Bootloader](https://img.youtube.com/vi/QvsuNHvU8mU/0.jpg)](https://www.youtube.com/watch?v=QvsuNHvU8mU)
      
##### 3c. Copy patch kedalam bootloader
Telah tertuang pada video tutorial ke-2
      
### 4. Mengatur settingan BIOS
Seperti kita tahu bahwa settingan BIOS akan berpengaruh pada sukses dan tidaknya sebuah instalasi.

Pada dasarnya, pengaturan bios agar dapat di install Hackintosh pada kebanyakan BIOS seperti pada Gigabyte AMI UEFI BIOS, Gigabyte AWARD BIOS, ASUS AMI UEFI BIOS, dan MSI AMI UEFI BIOS adalah sama.

* Load Optimized Defaults
* Jika CPU Punya menu `VT-d`, disable/matikan
* Jika system punya menu `CFG-Lock`, disable/matikan
* Jika system punya menu `Secure Boot Mode`, disable/matikan
* Jika punya menu `Set OS Type` ubah menjadi `Other OS`
* Jika system Punya menu `IO Serial Port`, disable/matikan
* Set `XHCI Handoff` menjadi Enabled
* Jika memiliki System BIOS merk AWARD 6 series atau x58, matikan USB 3.0
* Jika punya menu `CSM`, disable/matikan
* Save dan restart.

Sementara untuk masuk ke menu BIOS pada **Asrock Phantom Gaming 4s** dapat di lakukan dengan cara memencet tombol `DELETE` atau `F2` pada keyboard.

Settingan:
Setelah masuk bios pencet tombol `F6` untuk dapart masuk ke `Advanced Mode` pada BIOS **Asrock Phantom Gaming 4s**

Kemudian ikuti langkah seperti yang tertera pada gambar di bawah ini.

#### Versi BIOS P1.20
![Menu Utama](/Images/Asrock%20Phantom%20Gaming%204s/Bios%20Settings/1.jpg)

#### Chipset Configuration
![Chipset Configuration](/Images/Asrock%20Phantom%20Gaming%204s/Bios%20Settings/2.jpg)

#### VT-d
![VT-d](/Images/Asrock%20Phantom%20Gaming%204s/Bios%20Settings/3.jpg)

#### Share Memory
![Share Memory](/Images/Asrock%20Phantom%20Gaming%204s/Bios%20Settings/4.jpg)

#### USB Configuration
![USB Configuration](/Images/Asrock%20Phantom%20Gaming%204s/Bios%20Settings/5.jpg)

#### XHCI Hand-Off
![XHCI Hand-Off](/Images/Asrock%20Phantom%20Gaming%204s/Bios%20Settings/6.jpg)

#### Compability Support Module (CSM)
![CSM](/Images/Asrock%20Phantom%20Gaming%204s/Bios%20Settings/7.jpg)

#### CSM Disabled
![CSM Disabled](/Images/Asrock%20Phantom%20Gaming%204s/Bios%20Settings/8.jpg)

Setelah settingan ini selesai, lanjutkan save, maka kita dapat melanjutkan ke proses instalasi Mac OSX.


### 5. Instalasi
Berhubung video ini menggunakan Asus ROG GL552JX dengan konfigurasi BIOS yang berbeda, maka langsung di skip ke menit 1:08

[![Instalasi](https://img.youtube.com/vi/FAQUNGnBUTc/0.jpg)](https://youtu.be/FAQUNGnBUTc?t=68)

### 6. Konfigurasi Pasca Install/Post Install
### 7. Target Operasi dan Checklist
Hackintosh boleh di katakan berhasil apabila sistem operasi Mac OSX yang kita install stabil, tanpa kendala software maupun hardware. untuk itu tidak ada salahnya kita membuat sebuah checklist untuk menentukan apa saja yang perlu di lakukan agar dapat menghasilkan sistem operasi yang stabil.

Daftar Checklist:

#### 1. Instalasi ####
      - Install clover EFI boot loader.
      - Install UEFI Drivers (seperti AptioFix).
      - Install kexts (FakeSMC, LILU).
#### 2. CPU & Power management ####
      - Cek apakah baik CPU atau GPU Power management berjalan dengan baik.
            Cara Cek:
                  - CPU: Buka IOReg, cari X86PluginPlatform
                        jika ada, CPU PM sukses, jika tidak ada CPU PM gagal
                  - GPU: Buka IOReg, cari AGP, atau AGPM
                        jika ada, GPU PM sukses, jika tidak ada GPU PM gagal
      - Sleep/Wake/Shutdown/Restart works.
#### 3. VGA Grafis ####
      - QE/CI graphic.
      - Switchable graphics.
      - Graphic External ports (HDMI, DP, VGA).
      - Fix boot glitches.
      - Retina / HiDPI scaled resolutions.
#### 4. IO devices ####
      - USB ports.
      - Bluetooth.
      - Ethernet/LAN.
      - Wifi.
      - Webcam.
      - Keyboard dan function keys.
      - Keyboard, keyboard backlight,trackpad dan Fn keys. (Khusus Laptop)
      - Sata devices.
      - NVMe devices.
      - Optional Builtin cardreader and Webcam.
#### 5. Audio ####
      - Audio work: builtin Speaker, mic, Audio HDMI & external lines.
      - Audio after sleep.
#### 6. Miscellaneous ####
      - Battery status. (Khusus Laptop)
      - Screen brightness control. (Khusus Laptop)
      - iMessage/FaceTime.
      - AppleLPC kext Loaded
      - AppleSMBusController.kext loaded
      - AGP/AGPM di IoReg loaded
      - x86PlatformPlugin di IoReg Loaded

### 8. Troubleshoot dan Patching
- [Tutorial Patching DSDT/SSDT](/DSDT%20-%20SSDT%20Patching/README.md)
- [CPU Power Management](/DSDT%20-%20SSDT%20Patching/Daftar%20Patch/CPU%20Power%20Management)
- [Intel QuickSync dan iGPU Headless mode](/Catatan/Intel-igpu-headless-mode.md)
- [Cara Cek GPU Power Management](/Catatan/GPU-PowerManagement)
- [Patch Lainnya](/Catatan)

