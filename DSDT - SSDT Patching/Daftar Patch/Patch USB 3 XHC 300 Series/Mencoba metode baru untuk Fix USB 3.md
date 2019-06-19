Source : olarila.com/forum/viewtopic.php?f=28&t=10171

Status: Masih Gagal


## Pencarian SSDT Bermuatan XHC
1. mencari SSDT yanfg berisi XHC

## Membuat Metode Baru
2. membuat Method baru SSDT OEM di dalam Scope _SB.PCI0.XHC.RHUB (paling atas) yang cuma ada internal dan USB 2
3. Bagaimana bisa tahu yang ada cuma slot Internal dan USB 2?
Merujuk pada link sumber tentang `Conector Type` dalam spesifikasi `ACPI`

- Metode **GUPC** bernilai **0xFF** adalah **Internal**
- Metode **TUPC** bernilai **Zero** adalah **USB 2**
- Metode **MALD** bernilai **0x03** adalah **USB 3**
- Metode **TUPC** bernilai **0x09** adalah **USB Type-C** (Port HSxx/SSxx memiliki orientasi yang SAMA, dan memiliki switch internal)
- Metode **TUPC** bernilai **0x0A** adalah **USB Type-C** (Port HSxx/SSxx memiliki orientasi yang BEDA, dan TIDAK memiliki switch internal)


> sementara yang ada pada SSDT XHC hanya:
> Metode **GUPC** bernilai **0xFF** adalah **Internal**
> Metode **TUPC** bernilai **Zero** adalah **USB 2**

Maka perlu metode baru untuk mengidentifikasi USB 3 dan Type-C yaitu:
Metode **MALD** bernilai 0x03 adalah **USB 3**
Metode **MAL0** bernilai 0x09 adalah **USB Type-C** (Port HSxx/SSxx memiliki orientasi yang SAMA, dan memiliki switch internal)
Metode **MAL1** bernilai 0x0A adalah **USB Type-C** (Port HSxx/SSxx memiliki orientasi yang BEDA, dan TIDAK memiliki switch internal)

Walaupun USB Type-C tidak tersedia dalam motherboard Asrock Phantom Gaming 4s, ada baiknya tetap di buatkan metode tersebut.

Contoh code **GUPC**:

```
        Method (**GUPC**, 1, Serialized) // jv bawaan Internal
        {
            Name (PCKG, Package (0x04)
            {
                Zero, 
                **0xFF**, 
                Zero, 
                Zero
            })
            Store (Arg0, Index (PCKG, Zero))
            Return (PCKG)
        }
```

Contoh code **TUPC**:

```
        Method (**TUPC**, 1, Serialized) // jv Bawaan USB 2
        {
            Name (PCKG, Package (0x04)
            {
                One, 
                **Zero**, 
                Zero, 
                Zero
            })
            Store (Arg0, Index (PCKG, One))
            Return (PCKG)
        }
```

Maka untuk membuat port USB 3 misalnya, kita perlu membuat metode baru dibawah kedua metode di atas seperti berikut:

```
        //jv add property USB 3 - MALD 0x03
        Method (**MALD**, 1, Serialized)
        {
            Name (PCKG, Package (0x04)
            {
                One, 
                **0x03**, 
                Zero, 
                Zero
            })
            Store (Arg0, Index (PCKG, One))
            Return (PCKG)
        }
```

Buatkan juga untuk USB Type-C


---

## Enable dan disable port USB

Lihat pada method **_UPC** dalam masing-masing port

Keterangan
- **One** = Enabled
- **Zero** = Disabled

Contoh:

```
       Scope (\_SB.PCI0.XHC.RHUB.HS01)
        {
            Method (_UPC, 0, NotSerialized)  // _UPC: USB Port Capabilities
            {
                If (LEqual (H1TC, Zero))
                {
                    Return **(GUPC (H1CN))**
                }
                Else
                {
                    Return (\_SB.UBTC.RUCC (H1CR, One))
                }
            }
```

Karena HS01 merupakan Colokan port USB 2, maka Ubah Menjadi

```
       Scope (\_SB.PCI0.XHC.RHUB.HS01)
        {
            Method (_UPC, 0, NotSerialized)  // _UPC: USB Port Capabilities
            {
                If (LEqual (H1TC, Zero))
                {
                    Return **(TUPC (One))** // Jv Ket: TUPC=USB 2, One=Enabled
                }
                Else
                {
                    Return (\_SB.UBTC.RUCC (H1CR, One))
                }
            }
```