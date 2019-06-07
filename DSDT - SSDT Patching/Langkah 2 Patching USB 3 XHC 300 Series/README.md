# Patching USB 3 jenis XHC 300 Series

Membuat Patching USB 3 jenis XHC 300 Series yang ada pada **Asrock Phantom Gaming 4s** agar terdeteksi secara native/normal tanpa perlu menggunakan clover `kextToPatch` atau `SSDT-UIAC-ALL.aml` atau kext lain seperti `USBInjectAll.kext` atau sejenisnya

[Source Tutorial](https://www.tonymacx86.com/threads/asus-100-series-and-later-custom-ssdt-for-xhci-usb-port-control.253981/)


Discovered ports

# Discover Menggunakan flashdisk USB 2

Nama Port	| Posisi port			| Jenis port secara Visual
----------------|-------------------------------|-------------------------
hs01 		| belakang bawah luar 		| port usb 2
hs02 		| belakang bawah dalam 		| port usb 2
hs03 		| belakang tengah luar 		| port usb 3
hs04 		| belakang tengah dalam 	| port usb 3
hs07 		| belakang atas dalam 		| port usb 3
hs08 		| belakang atas luar 		| port usb 3
hs09 		| atas tengah 			| port usb 2
hs10 		| atas belakang 		| port usb 2
hs13 		| atas depan 			| port usb 3

----

# Discover Menggunakan HDD USB 3

Nama Port	| Posisi port			| Jenis port secara Visual
----------------|-------------------------------|-------------------------
SS01 		| belakang atas dalam 		| port usb 3
SS02 		| belakang atas luar 		| port usb 3
SS03 		| belakang tengah dalam 	| port usb 3
SS04 		| belakang tengah luar 		| port usb 3
SS08 		| atas depan 			| port usb 3

> Catatan
- Semua port yang ada di atas yang wajib di buka
- Semua port **SELAIN* yang ada di atas yang wajib di non aktifkan dengan memberikan syntax `Return (GUPC (Zero))` kemudian hapus/beri tanda komen pada syntax di bawahnya

contoh, port `HS06` tidak ada di list di atas, sehingga kita wajib menonaktifkan agar port yang lain bisa di baca:

> Kode asli
`Scope (\_SB.PCI0.XHC.RHUB.HS05)
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
`

> di ganti dengan menambahkan syntax `Return (GUPC (Zero))`

`Scope (\_SB.PCI0.XHC.RHUB.HS05)
        {
            Method (_UPC, 0, NotSerialized)  // _UPC: USB Port Capabilities
            {
                Return (GUPC (Zero))
                //jv disabled: Mengganti kode dalam komen di bawah menjadi Return (GUPC (Zero))
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
            }
`
