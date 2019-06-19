# Daftar Patch

## Patch Motherboard
Merujuk pada [Tutorial patching DSDT/SSDT](https://github.com/javanesse/Asrock-Phantom-Gaming-4s-Hackintosh/tree/master/DSDT%20-%20SSDT%20Patching), juga menelisik daftar jenis konfigurasi hardware apa saja yang di tanamkan pada motherboard dalam kasus ini [Asrock Phntom Gaming 42](https://www.asrock.com/MB/Intel/Z390%20Phantom%20Gaming%204S/index.asp#Specification), serta beberapa kali proses dumping menggunakan windows menggunakan AIDA64, SIW-64 (System info), Speecy, dll, untuk mengetahui hardware secara pasti, dan beberapa kali melakukan proses experimental, maka seluruh patch untuk Asrock Phantom Gaming 4s yang sekali lagi merujuk pada tutorial tersebut, saya niatkan untuk di gabungkan menjadi satu.

Namun ada beberapa kendala yang terjadi apabila di satukan menjadi 1 file, salah satunya adalah, terjadinya konflik saat melakukan rename

*Contoh:*
> Ketika melakukan 2 patch sekaligus, misal rename `GFX0 menjadi IGPU`, kemudian ingin juga merubah `PEGP menjadi GFX0`. Hal ini akan menjadi sumber konflik dimana ketika merubah `GFX0 menjadi IGPU`, kemudian tertimpa kembali setelah patching `PEGP menjadi GFX0`, yang akan menjadikan `PEGP` yang baru saja kita ubah menjadi `GFX0`, akan di ubah kembali menjadi `IGPU` pula, karena ada syntax patch untuk merubah kata GFX0 menjadi IGPU.

Masing-masing patch ini sendiri telah di bekali dengan keterangan apa saja yang di masukkan kedalam patch tersebut.

Kesimpulannya adalah, lakukan patching motheroard sesuai urutan

> WAJIB Lakukan extract ACPI file kembali dan lakukan patching dari awal apabila mengganti /merubah konfigurasi hardware

## kemungkinan perubahan konfigurasi hardware
### Prosesor Integrated GPU UHD 630
Masing-masing prosesor berbasis Intel, saat ini telah di bekali dengan GPU di dalam prosesor itu sendiri dengan model dan jenis yang berbeda pula.Sebagai contoh, [prosesor Intel Core i7 8700 telah di bekali dengan GPU Intel UHD 630](https://ark.intel.com/content/www/us/en/ark/products/126686/intel-core-i7-8700-processor-12m-cache-up-to-4-60-ghz.html), yang notabene berbeda dengan prosesor-prosesor lain

Oleh karenanya, patch ini di pisahkan dari patch motherboard, agar dapat di ubah sesuai keinginan.

> Tidak semua prosesor memiliki GPU 630. adapun patch di atas merupakan patch **KHUSUS** hanya untuk prosesor intel core i7 8700.


### USB 3 XHC 300 Series
perangkat USB ini pun akan mengalami perubahan apabila di colokkan pada port motherboard yang berbeda dengan  yang telah saya terapkan pada motherboard saya.

> FYI: saya mencolokkan port USB 2 dan USB 3 pada front panel casing komputer pada port yang terletak paling bawah pada motherboard

patch ini akan di lakukan investigasi lebih lanjut.

### PCI devices Tambahan
PCI devices tambahan ini secara otomatis di generate oleh software `Hackintol` yang kemudian dapat di export menjadi beberapa format file, di antaranya

- teks berformat `txt`, 
- Clover config berformat `plist`, 
- ACPI berformat `DSL`,
- dan juga json

Adapun fungsi dari PCI tambahan ini adalah untuk mengetahui device apa saja yang tertancap pada hackintosh kita, serta mengetahui apakah hardware tersebut memilki `kext` yang terload ataupun belum, yang bisa di lihat di `System Information` bagian PCI.

Namun dengan segala **PERINGATAN** yang ada, saya tekankan bahwa patching PCI Device menggunakan metode ACPI patch, dapat mengakibatkan gagal sleep atau berpotensi kegagalan-kegagalan lainnya.

Untuk itu, saya sarankan, gunakan `Clover config` patch untuk memunculkan PCI Devices ini, apabila ingin mengetahui bahwa `Kexts` dari PCI-PCI tersebut apakah sudah terload atau belum.

### Patch CPU Power Management
[Lihat keterangan dalam folder tersebut](/CPU%20Power%20Management)

# Cara menggunakan patch
### Untuk menggunakan patch ini, di perlukan aplikasi MacIASL.
Cukup copy paste patch yang ingin di aplikasikan

### Singkronisasi antar File
mengingat patch HARUS seragam antara DSDT dan SSDT-SSDT yang lain, maka lakukan juga patch yang sama terhadap SSDT-SSDT yang ada, namun dikarenakan patch DSDT membubuhkan device tambahan seperti `DTGP`, `MCHC`, maka syntax-syntax tersebut harap di hapus terlebih dahulu (apabila ada) saat melakukan patcing SSDT, karena SSDT tidak memerlukan hal itu, serta menghindari konflik device ganda.
