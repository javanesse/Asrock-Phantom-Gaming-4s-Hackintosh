# Daftar Patch


Merujuk pada [Tutorial patching DSDT/SSDT](https://github.com/javanesse/Asrock-Phantom-Gaming-4s-Hackintosh/tree/master/DSDT%20-%20SSDT%20Patching), serta beberapa kali proses experimental, maka seluruh patch untuk Asrock Phantom Gaming 4s yang sekali lagi merujuk pada tutorial tersebut, saya niatkan untuk di gabungkan menjadi satu.

Namun ada beberapa kendala yang terjadi apabila di satukan menjadi 1 file, salah satunya adalah, terjadinya konflik saat melakukan rename
*Contoh:*
> Ketika melakukan 2 patch sekaligus, misal rename GFX0 menjadi IGPU, kemudian ingin juga merubah PEGP menjadi GFX0. Hal ini akan menjadi sumber konflik dimana ketika merubah GFX0 menjadi IGPU, kemudian tertimpa kembali setelah patching PEGP menjadi GFX0, yang akan menjadikan PEGP yang baru saja kita ubah menjadi GFX0, akan di ubah kembali menjadi IGPU pula.


Patch di sini berisi dengan patch beberapa part komputer di antaranya:
- Patch Motherboard Asrock Phantom Gaming 4s
- Patch GPU Intel UHD 630 dari intel core i7 8700
- Patch patch tambahan lain


Untuk menggunakan patch ini, di perlukan aplikasi MacIASL.
Cukup copy paste patch yang ingin di aplikasikan
