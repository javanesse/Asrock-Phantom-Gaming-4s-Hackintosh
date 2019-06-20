# Crash

Ketika menggunakan `SMBios 19,2` kemudian memasang kartu grafis berjenis [Sapphire Nitro AMD RX 580 8GB](https://www.sapphiretech.com/en/consumer/nitro-rx-580-8g-g5),
yang mana support OS X mojave 10.14.5 tanpa perlu `driver(kext)` tambahan,
disini saya mengalami crash pada saat  melakukan editing video menggunaka **Final Cut Pro X** yang membuat komputer secara konstant melakukan restart.

## ALTERNATIF 1
Untuk mengatasi masalah ini, saya mengatur ulang `BIOS` pada bagian `Chipset Configuration > Primary Graphics Adapter`, menjadi `Onboard`,
sehingga dalam bagian `Graphics` pada `System Information`, menjadi 2 buah GPU yaitu Intel UHD 630 dan AMD RX 580.

![Primary Graphics Adapter](https://github.com/javanesse/Asrock-Phantom-Gaming-4s-Hackintosh/raw/master/Images/Asrock%20Phantom%20Gaming%204s/Bios%20Settings/3.jpg)

## ALTERNATIF 2
ubah SMBios jadi iMac Pro 1,1, `Chipset configuration > Primary Graphics Adapter` tetap menggunakan `PCI-Express`

masalah FCPX render gagal, teratasi
namun masalah baru akan timbul, yaitu persoalan USB 3 yang menjadi tidak terdeteksi.

Untungnya `USBPort.kexts` dapat di akali dengan mengubah `Plist` dalam kext tersebut menjadi model mengikuti SMBios
Misal SMBios kita 19,2 maka ubah Plist dari kext tersebut menjadi 19,2 begitupula dengan SMBios-SMBios Lainnya.


# CRASH LAGI
Setelah melakukan Update `FCP X` dari versi `10.4.3` ke `10.4.6`, Aplikasi `FCP X` tidak mau terbuka, dengan result error

```
Applications/Final Cut Pro.app/Contents/MacOS/../Frameworks/ProGraphics.framework/Versions/A/ProGraphics abort() called
```
akhirnya kembali menggunakan [ALTERNATIF 1](#alternatif-1) dan semua berjalan dengan lancar.

# Kesimpulan
Kesimpulan untuk saat ini adalah, ketika mengalami `ERROR` saat menggunakan aplikasi `FCP X`, maka cobalah untuk mengatur konfigurasi chipset BIOS seperti yang di tuangkan pada [ALTERNATIF 1](#alternatif-1) di atas.
