DSDT ini adalah hasil transpose `config.plist` device properties yang berisi GPU UHD 630 menjadi sebuah DSDT.

Untuk menggunakan DSDT ini, di wajibkan menghapus `PciRoot(0x0)/Pci(0x2,0x0)` yang berada pada `config.plist` device properties yang terdapat pada folder EFI

`config.plist` yang ada pada folder ini adalah sama dengan yang ada di dalam folder EFI, hanya saja `PciRoot(0x0)/Pci(0x2,0x0)` telah terhapus
