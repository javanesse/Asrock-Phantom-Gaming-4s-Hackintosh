# Daftar Patch

## Patch Motherboard
Merujuk pada [Tutorial patching DSDT/SSDT](https://github.com/javanesse/Asrock-Phantom-Gaming-4s-Hackintosh/tree/master/DSDT%20-%20SSDT%20Patching), juga menelisik daftar jenis konfigurasi hardware apa saja yang di tanamkan pada motherboard dalam kasus ini [Asrock Phntom Gaming 42](https://www.asrock.com/MB/Intel/Z390%20Phantom%20Gaming%204S/index.asp#Specification), serta beberapa kali proses dumping menggunakan windows untuk mengetahui hardware secara pasti, dan beberapa kali melakukan proses experimental, maka seluruh patch untuk Asrock Phantom Gaming 4s yang sekali lagi merujuk pada tutorial tersebut, saya niatkan untuk di gabungkan menjadi satu.

Namun ada beberapa kendala yang terjadi apabila di satukan menjadi 1 file, salah satunya adalah, terjadinya konflik saat melakukan rename

*Contoh:*
> Ketika melakukan 2 patch sekaligus, misal rename `GFX0 menjadi IGPU`, kemudian ingin juga merubah `PEGP menjadi GFX0`. Hal ini akan menjadi sumber konflik dimana ketika merubah `GFX0 menjadi IGPU`, kemudian tertimpa kembali setelah patching `PEGP menjadi GFX0`, yang akan menjadikan `PEGP` yang baru saja kita ubah menjadi `GFX0`, akan di ubah kembali menjadi `IGPU` pula, karena ada syntax patch untuk merubah kata GFX0 menjadi IGPU.

Masing-masing patch ini sendiri telah di bekali dengan keterangan apa saja yang di masukkan kedalam patch tersebut.

## Serta kemungkinan perubahan konfigurasi baik hardware maupun software, misalnya penggantian Prosesor.
Masing-masing prosesor berbasis Intel, saat ini telah di bekali dengan GPU di dalam prosesor itu sendiri dengan model dan jenis yang berbeda pula.Sebagai contoh, [prosesor Intel Core i7 8700 telah di bekali dengan GPU Intel UHD 630](https://ark.intel.com/content/www/us/en/ark/products/126686/intel-core-i7-8700-processor-12m-cache-up-to-4-60-ghz.html).

Oleh karenanya, patch ini di pisahkan dari patch motherboard, agar dapat di ubah sesuai keinginan

Patch di sini berisi dengan patch beberapa part komputer di antaranya:
- Patch Motherboard Asrock Phantom Gaming 4s
- Patch GPU Intel UHD 630 dari intel core i7 8700
- Patch patch tambahan lain


Untuk menggunakan patch ini, di perlukan aplikasi MacIASL.
Cukup copy paste patch yang ingin di aplikasikan
