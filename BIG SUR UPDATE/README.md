ChangeLogs:
1. Bios Asrock Phantom Gaming 4s - z390 Menggunakan Bios Terbaru Versi 1.40 yang bisa di unduh di website resmi asrock : https://asrock.com/MB/Intel/Z390%20Phantom%20Gaming%204S/index.asp#Overview
2. Perubahan VGA Card Menggunakan Gigabyte RX Vega 64
3. Perubahan Bootloader yang tadinya menggunakan Clover Bootloader, Sekarang menggunakan OpenCore 0.6.5

Metode Install:
1. Buat USB Installer Big Sur Melalui terminal
2. Mount Partisi EFI
3. Copy Folder EFI EFI
4. Boot ke Windows
5. Update BIOS Motheboard melalui Windows
6. Jalankan Instalasi Mac OS X

Post Install:
1. Upayakan Install di hardisk lain, Untuk jaga-jaga apabila terjadi kegagalan.
1. Setelah terinstall, Buka Partisi EFI pada Hardisk menggunakan aplikasi Opencore Configurator (Atau yang lain)
2. Copy Folder EFI ke partisi EFI di Hardisk


TroubleShoot:
1. Bila terjadi Gagal Boot, Hal Ini di sebabkan Karena Update BIOS. Ada 2 metode untuk mengatasi hal ini
  - Downgrade kembali Bios Ke 1.20
  - Tambahkan SSDT-SET-STAS-Darwin.aml yang ada pada folder ACPI di atas.

Known Issue
- No Sleep

Good Luck
