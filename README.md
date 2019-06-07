# Asrock-Phantom-Gaming-4s-Hackintosh
This Repo for Asrock Phantom Gaming 4s Hackintosh with intel core i7 8700 running Mojave 10.14.5

Langkah membuat hackintosh Terkhusus pada komputer yang menggunakan Asrock Phantom Gaming 4s Hackintosh dengan prosesor intel core i7 8700

**Untuk hardware lain pun** dapat mengikuti tutorial ini

Hal yang di perlukan dalam instalasi Hackintosh pada dasarnya sama dengan instalasi microsoft windows pada umumnya, hanya saja produsen hardware tidak meyediakan driver (kexts) untuk sistem operasi Mac OSX.

Repo ini sendiri boleh di katakan ini adalah repo driver (kext) untuk mac osx khusus hardware-hardware yang ada pada spesifikasi. dengan kata lain, jika spesifikasi komputer Anda kebetulan sama dengan komputer ini, maka langkah instalasi hackintosh Anda akan semakin mudah karena sudah tersedia driver (kext) untuk hardware jenis ini.


## Hardware yang saya gunakan

Nama                | Merk               | Seri
--------------------|--------------------|--------------------
Prosesor            | Intel              | [core i7 8700](https://ark.intel.com/content/www/us/en/ark/products/126686/intel-core-i7-8700-processor-12m-cache-up-to-4-60-ghz.html)
Motherboard         | Asrock             | [Phantom Gaming 4s](https://www.asrock.com/MB/Intel/Z390%20Phantom%20Gaming%204S/index.asp)
Ram                 | Team               | [T-force Delta 16GB](https://www.teamgroupinc.com/en/product/delta-rgb-ddr4)
Storage             | Sandisk            | [SSD Plus 250GB](https://www.sandisk.id/home/ssd/ssd-plus)
Heatsink            | Deepcool           | [Gammax 300](http://www.deepcool.com/product/cpucooler/2013-12/7_481.shtml)
Power Supply        | Power Up           | 80+ Bronze 600 watt
Casing              | Power Up           | [Raptor 1707](https://www.bukalapak.com/p/komputer/aksesoris-226/aksesoris-lainnya-241/mt3i5k-jual-power-up-silver-strike-1707-black-no-psu)

adapun yang perlu di perhatikan dari spesifikasi komputer saya di atas **HANYA** `Motherboard` dan `CPU`. selebihnya terserah pilihan Anda.

## Langkah Instalasi
1. Persiapan hardware
2. Download OS
3. Membuat bootable USB
4. Mengatur settingan BIOS
5. Instalasi
6. Konfigurasi
7. Target Operasi dan Checklist
8. Troubleshoot dan patching

### 1. Persiapan hardware
Seperti yang saya utarakan di atas, bahwasannya persiapan hardware sebelum melakukan instalasi ini, kita fokus pada `Motherboard` dan `CPU`. Selebihnya terserah pilihan Anda.

> **KHUSUS** bagi yang pertama kali ingin melakukan instalasi hackintosh, karena pembuatan `Bootable USB` hanya bisa di lakukan melalui MAC OSX, maka dengan sangat menyesal saya katakan saya tidak akan membuat tutorialnya.

Alternatifnya adalah menginstall hackintosh distro, menginstall hackintosh di VMware atau virtualBox, atau paling mudah, buat bootable USB dengan macbook kepunyaan teman


Lanjut ke topik,
Untuk patching hardware lain selain **Asrock Phantom Gaming 4s**, metode yang di gunakan adalah sama persis, hanya saja kita butuh `patch` yang berbeda.
adapun cara membuat `patch` untuk hardware lain, silahkan langsung ke langkah **#8. Troubleshoot dan patching.**

### 2. Download OS
### 3. Membuat bootable USB
### 4. Mengatur settingan BIOS
### 5. Instalasi
### 6. Konfigurasi
### 7. Target Operasi
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

### 8. Troubleshoot dan patching

