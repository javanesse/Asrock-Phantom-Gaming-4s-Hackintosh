DSDT ini adalah hasil transpose/pemindahan `PCI device properties` dari folder `Generated PCI Devices from Hackintool` yang berisi semua PCI devices menjadi sebuah DSDT. sehingga nantinya di dalam System Information, muncul daftar PCI.

Pengecualian terjadi pada bagian `IGPU` yang memiliki patch khusus agar Intel UHD 630 dapat berjalan dengan sempurna.

> NOTE: patch khusus untuk properti dari IGPU dalam `DSDT` ini, menyematkan kode untuk menonaktifkan external GPU. 

Bagaimana cara mengaktifkan external GPU? sesuaikan apa yang di gunakan untuk patching.

Hapus baris `"disable-external-gpu", Buffer () { 0x01, 0x00, 0x00, 0x00 },` pada `DSDT.dsl` kemudian compile kembali menjadi DSDT.aml menggunakan MacIASL apabila menggunakan external GPU, simpan di folder `EFI > Clover > ACPI > Patched`.

Adapun cara mengimplementasikan sebuah device properties dari clover config adalah sebagai berikut:
1. dari sekian banyak device properties (PCI), di dapat dari aplikasi `hacktool > PCI > Export`
2. Masukkan dan sesuaikan file `DSL` dari hasil generate ke dalam DSDT


# ERROR

Untuk sementara file `DSDT.dsl` di atas hanya menyematkan kode untuk `IGPU` untuk VGA dan `HDEF` untuk AUDIO saja.
Hal ini di karenakan permasalahan sleep yang terjadi saat mengimplementasikan seluruh `PCI Devices` kedalam DSDT.

Adapun permasalahan yang terjadi ketika mengimplementasikan seluruh `PCI Devices` kedalam DSDT adalah komputer menolak untuk melakukan sleep secara benar (Monitor mati namun CPU tetap berputar).


## Alternatif Aman
penyematan PCI devices ini berguna sebagai kosmetik saja, maka cara paling aman untuk memberikan kosmetik ini adalah menggunakan CloverBootloader

Namun perlu menghapus device yang sudah di sematkan kedalam DSDT, dalam kasus ini `IGPU` dan `HDEF`.
