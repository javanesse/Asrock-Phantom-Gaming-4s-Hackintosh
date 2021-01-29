ChangeLogs:
1. Bios Asrock Phantom Gaming 4s - z390 Menggunakan Bios Terbaru Versi 1.40 yang bisa di unduh di [website resmi asrock](https://asrock.com/MB/Intel/Z390%20Phantom%20Gaming%204S/index.asp#Overview) 
2. Perubahan VGA Card Menggunakan [Gigabyte RX Vega 64](https://www.gigabyte.com/id/Graphics-Card/GV-RXVEGA64-8GD-B)
3. Perubahan Bootloader yang tadinya menggunakan Clover Bootloader, dan Sekarang menggunakan OpenCore

---

## Metode Install:
> Upayakan Install di hardisk lain, Untuk jaga-jaga apabila terjadi kegagalan.
1. Boot ke Windows
2. Update BIOS Motheboard melalui Windows
3. Restart
1. Buat USB Installer Mac OS X Big Sur Melalui terminal menggunakan Sistem operasi Mac [Atau menggunakan Windows](https://dortania.github.io/OpenCore-Install-Guide/installer-guide/winblows-install.html)
3. Copy Folder EFI ke partisi EFI yang baru di buat
6. Jalankan Instalasi Mac OS X

---

## Post Install:
1. Setelah terinstall, Buka Partisi EFI pada Hardisk menggunakan aplikasi Opencore Configurator (Atau yang lain)
2. Copy Folder EFI ke partisi EFI di Hardisk

---

## TroubleShoot:
1. Bila terjadi Gagal Boot, Hal Ini di sebabkan Karena Update BIOS. Ada 2 metode untuk mengatasi hal ini
  - Downgrade kembali Bios Ke 1.20
  - Tambahkan SSDT-SET-STAS-Darwin.aml yang ada pada folder ACPI di atas.

---

## Known Issue
- Kosong
---

Good Luck
