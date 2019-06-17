# Patching USB 3 jenis XHC 300 Series

Membuat Patching **USB 2** dan **USB 3** jenis XHC 300 Series yang ada pada **Asrock Phantom Gaming 4s** agar terdeteksi secara normal

[Source Tutorial](https://www.tonymacx86.com/threads/asus-100-series-and-later-custom-ssdt-for-xhci-usb-port-control.253981/)


## Discovered ports in Asrock Phantom Gaming 4s


Total Port yang terdapat pada `SSDT-3-xh_cfsd4.dsl` tepatnya di bawah scope `\SB.PCI0.XHC.RHUB`
- 14 port HS (High Speed)	:	 HS01 sampai HS14
- 10 port SS (super Speed)	:	 SS01 sampai SS10
- 2  port USR			:	 USR1 dan USR2


### Discover Menggunakan flashdisk USB 2

Nama Port	| Posisi fisik port		| Jenis port secara Visual
----------------|-------------------------------|-------------------------
HS01 		| belakang bawah luar 		| port usb 2
HS02 		| belakang bawah dalam 		| port usb 2
HS03 		| belakang tengah luar 		| port usb 3
HS04 		| belakang tengah dalam 	| port usb 3
HS07 		| belakang atas dalam 		| port usb 3
HS08 		| belakang atas luar 		| port usb 3
HS09 		| atas tengah 			| port usb 2
HS10 		| atas belakang 		| port usb 2
HS13 		| atas depan 			| port usb 3

---

## Discover Menggunakan HDD USB 3

Nama Port	| Posisi fisik port		| Jenis port secara Visual
----------------|-------------------------------|-------------------------
SS01 		| belakang atas dalam 		| port usb 3
SS02 		| belakang atas luar 		| port usb 3
SS03 		| belakang tengah dalam 	| port usb 3
SS04 		| belakang tengah luar 		| port usb 3
SS08 		| atas depan 			| port usb 3

---

## berikut visualisasi port-port di atas
![Panel Belakang](https://github.com/javanesse/Asrock-Phantom-Gaming-4s-Hackintosh/blob/master/Images/Asrock%20Phantom%20Gaming%204s/USB%20port%20Maps/Asrock%20Phantom%20Gaming%204s%20back%20panel.jpg)
![Board](https://github.com/javanesse/Asrock-Phantom-Gaming-4s-Hackintosh/blob/master/Images/Asrock%20Phantom%20Gaming%204s/USB%20port%20Maps/Asrock%20Phantom%20Gaming%204s%20board.jpg)

---

## Port yang tidak terdeteksi oleh perangkat USB dan wajib di disable
Dengan terdeteksinya port-port di atas, maka otomatis port selain di atas perlu di nonaktifkan/disable

Nama Port	| Posisi fisik port		| Jenis port secara Visual
----------------|-------------------------------|-------------------------
HS05		| Unknown 			| Unknown
HS06 		| Unknown 			| Unknown
HS11 		| Unknown 			| Unknown
HS12 		| Unknown 			| Unknown
HS14 		| Unknown 			| Unknown
SS05		| Unknown 			| Unknown
SS06 		| Unknown 			| Unknown
SS07 		| Unknown 			| Unknown
SS09 		| Unknown 			| Unknown
SS10 		| Unknown 			| Unknown
USR1 		| Unknown 			| Unknown
USR2 		| Unknown 			| Unknown


#### Catatan
- Hanya port yang terdeteksi di atas yang wajib di buka
- Semua port yang tidak terdeteksi oleh perangkat USB, pelu di non aktifkan dengan memberikan syntax `Return (GUPC (Zero))` kemudian hapus/beri tanda komen pada syntax di bawahnya



contoh, port `HS05` tidak terdeteksi oleh perangkat USB, sehingga kita wajib menonaktifkan agar port yang lain bisa di baca:

> Kode asli
```
Scope (\_SB.PCI0.XHC.RHUB.HS05)
        {
            Method (_UPC, 0, NotSerialized)  // _UPC: USB Port Capabilities
            {
                If (LEqual (H5TC, Zero))
                {
                    Return (GUPC (H5CN))
                }
                Else
                {
                    Return (\_SB.UBTC.RUCC (H5CR, One))
                }
            }
```

> di ganti dengan syntax `Return (GUPC (Zero))`

```
Scope (\_SB.PCI0.XHC.RHUB.HS05)
        {
            Method (_UPC, 0, NotSerialized)  // _UPC: USB Port Capabilities
            {
                //jv mendisable port HS05 Mulai
                Return (GUPC (Zero))
                /*
                If (LEqual (H5TC, Zero))
                {
                    Return (GUPC (H5CN))
                }
                Else
                {
                    Return (\_SB.UBTC.RUCC (H5CR, One))
                }
                */
                //jv mendisable port HS05 selesai
            }
```


Adapun cara mengetahui berhasil dan tidaknya patch ini, selain semua USB 2 dan USB 3 terdeteksi, adalah dengan cara melihat masing-masing `Current Available (mA)` pada `System Information > USB`.

```
USB 2 Current Available (mA) = 500
USB 3 Current Available (mA) = 900
```

---

## Patch Warna ikon pada USB 3

Setelah SSDT baru dalam hal ini SSDT-3.aml di implementasikan, sampai disini boleh di bilang berhasil, namun masih ada kendala pada perangkat USB 3, yaitu **terdeteksi sebagai perangkat internal**, dan hanya satu port yang benar, yaitu ketika mencolokkan ke port [SS04](https://github.com/javanesse/Asrock-Phantom-Gaming-4s-Hackintosh/blob/master/DSDT%20-%20SSDT%20Patching/Langkah%202%20Patching%20USB%203%20XHC%20300%20Series/README.md#berikut-visualisasi-port-port-di-atas), akan terdeteksi sebagai perangkat external (ikon kuning/orange muncul di desktop).

> Target: Targetnya adalah membuat semua USB 3 terdeteksi sebagai external seperti halnya ketika mencolokkan perangkat ke port `SS04`.

setelah di lihat di aplikasi `Hackintool`, ternyata port `SS04` tersebut memiliki jenis konektor `TypeC+Sw`.

![Sebelum](https://github.com/javanesse/Asrock-Phantom-Gaming-4s-Hackintosh/blob/master/Images/Hackintool/hackintool%20usb%203%20patch-before.png)

Di karenakan hanya SS04 yang mendeteksi perangkat `USB3` sebagai perangkat external(ikon warna orange), maka kita perlu menyamakan konektor seperti yang terdapat pada `SS04`.
![Sesudah](https://github.com/javanesse/Asrock-Phantom-Gaming-4s-Hackintosh/blob/master/Images/Hackintool/hackintool%20usb%203%20patch-after.png)

dari gambar di atas, lakukan juga terhadap port USB 2 yang terdeteksi sebagai `internal`, kemudian mengubah konektor sebagai `USB2`.

Selesai dan patch siap di export.

![Export](https://github.com/javanesse/Asrock-Phantom-Gaming-4s-Hackintosh/blob/master/Images/Hackintool/hackintool%20usb%203%20patch-export.png)

terdapat 4 file baru di desktop
- 3 ACPI
- 1 Kext

### Langkah Install:

terdapat 2 pilihan untuk menginstall patch baru ini

1. Install kext di clover
install kext `USBPorts.kext` kedalam `EFI/CLOVER/Kexts/Others`, dan kemudian hapus `DSDT-3.aml` di dalam folder `ACPI` bila ada.

2. Hapus DSDT-3.aml dari `clover` (sudah tidak di pakai lagi)
tempatkan ke-3 file AML ke folder patched menggantikan USB-3.aml sebelumnya. tambahkan `Sort Order` pada clover config sehingga ketiga AML/ACPI tersebut ter-load saat booting.

silahkan pilih salah satu.
patch dalam folder EFI disini menggunakan metode pertama yaitu install `USBPorts.kext` kedalam `EFI/CLOVER/Kexts/Others` dengan alasan kepraktisan.
Namun kekurangannya adalah, kext ini tidak akan berjalan apaila kita melakukan perubahan `SMBios`, maka jika melakukan perubahan `SMbios`, perlu di lakukan patch ulang menggunakan `SSDT-3.aml` dan `Hackintool`.

lanjutkan Reboot, dan test. apabila perangkat USB 2 ataupun USB 3 muncul di desktop setelah di colokkan, artinya patching sukses.


Adapun tutorial lain mengenai usb 100/200/300 series tanpa menggunakan hackintool, yang artinya pure ACPI patching menggunakan tutorial [disini](https://olarila.com/forum/viewtopic.php?f=28&t=10171)


Sekian.
