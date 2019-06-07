DSDT ini adalah hasil transpose/pemindahan `config.plist` device properties yang berisi semua PCI devices menjadi sebuah DSDT.

Untuk menggunakan DSDT ini, di wajibkan menghapus semua properties yang berada pada `config.plist`. gunakan clover configurator untuk mengubah, `clover > device > properties` yang terdapat pada folder EFI

`config.plist` yang ada pada folder ini adalah sama dengan yang ada di dalam folder EFI, hanya saja semua properties telah terhapus

> NOTE: Baik `config.plist` maupun `DSDT` ini, menyematkan kode untuk menonaktifkan external GPU. 

Bagaimana cara mengaktifkan external GPU? sesuaikan apa yang di gunakan untuk patching.

1. Apabila menggunakan DSDT sebagai patch GPU, hapus baris `"disable-external-gpu", Buffer () { 0x01, 0x00, 0x00, 0x00 },` pada DSDT.dsl kemudian compile kembali menjadi DSDT.aml menggunakan MacIASL apabila menggunakan external GPU, simpan di folder `EFI > Clover > ACPI > Patched`.

2. Apabila menggunakan clover sebagai patch GPU, hapus baris `disable-external-gpu` pada `config.plist` `clover > device > properties` yang terdapat pada `PciRoot(0x0)/Pci(0x2,0x0)` kemudian save.


Adapun cara mengimplementasikan sebuah device properties dari clover config adalah sebagai berikut:
1. dari sekian banyak device properties (PCI), di dapat dari aplikasi `hacktool > patch > pci devices > Use all data method > generate`
2. export ke `config.plist`
3. setelah di test dan benar, maka kita mulai mengimplentasikannya ke sebuah `dsdt` dengan cara mengulangi step pertama
4. kali ini pilih opsi iASL DSL Source pda `hackintool`, baru kemudian di sesuaikan ke dalam dsdt.

adapun tanda perubahan dalam syntax dsdt saya tandai dengan komen `//jv add xxx begin` dan di akhiri dengan `//jv add xxx end`
