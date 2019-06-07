DSDT ini adalah hasil transpose/pemindahan `config.plist` device properties yang berisi GPU UHD 630 menjadi sebuah DSDT.

Untuk menggunakan DSDT ini, di wajibkan menghapus `PciRoot(0x0)/Pci(0x2,0x0)` yang berada pada `config.plist`. gunakan clover configurator untuk mengubah, `clover > device > properties` yang terdapat pada folder EFI

`config.plist` yang ada pada folder ini adalah sama dengan yang ada di dalam folder EFI, hanya saja `PciRoot(0x0)/Pci(0x2,0x0)` telah terhapus

> NOTE: Baik `config.plist` maupun `DSDT` ini, menyematkan kode untuk menonaktifkan external GPU. 

Bagaimana cara mengaktifkan external GPU? sesuaikan apa yang di gunakan untuk patching.

1. Apabila menggunakan DSDT sebagai patch GPU, hapus baris `"disable-external-gpu", Buffer () { 0x01, 0x00, 0x00, 0x00 },` pada DSDT.dsl kemudian compile kembali menjadi DSDT.aml menggunakan MacIASL apabila menggunakan external GPU, simpan di folder `EFI > Clover > ACPI > Patched`.

2. Apabila menggunakan clover sebagai patch GPU, hapus baris `disable-external-gpu` pada `config.plist` `clover > device > properties` yang terdapat pada `PciRoot(0x0)/Pci(0x2,0x0)` kemudian save.
