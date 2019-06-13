# SSDT tambahan untuk CPU Power Management

> Native macOS power management membuat kombinasi prosesor dan GPU guna memberikan performance dan efisiensi terbaik.


* `SSDT-PluginType1` ini merupakan pengganti dari `PluginType` yang ada di clover
* Dengan `SSDT-PluginType1` ini, maka tidak perlu lagi untuk memberikan tanda centang pada `PluginType` pada Clover sehingga clover lebih bersih

```
SSDT-PluginType1.aml will require edits to work with your ACPI.
(your Processor objects are not at _PR.CPU0... look at your DSDT and you'll see).

Probably it is easier to use config.plist/ACPI/SSDT/Generate/PluginType=true.
```

dari keterangan [di atas](https://www.tonymacx86.com/threads/macos-native-cpu-igpu-power-management.222982/page-52), menunjukkan bahwa menggunakan SSDT ini diperlukan adaptasi letak CPU.

pada `SSDT-PluginType1` standard, lokasi CPU berada pada `_PR.CPU0`, namun apabila di implementasikan begitu saja, maka tidak akan memberikan pengaruh apa-apa terhadap motherboard dalam hal ini Asrock, karena letak CPU berada pada `_SB.PR00` (Lihat SSDT Bawaan)

maka perlu penggantian syntax `_PR.CPU0` menjadi `_SB.PR00` agar plugin ini berjalan dengan sempurna.

---

**Cara Pengujian**

- Hilangkan centang `PluginType` pada clover
- Tempatkan plugin ini ke dalam folder `ACPI > Patched` pada partisi Clover `EFI`
- Restart
- Buka aplikasi `IOReg`
- Cari `X86PlatformPlugin` dan `AGP` atau `AGPM`
- Apabila `X86PlatformPlugin` dan `AGP` atau `AGPM` muncul, maka Power management Aktif
- Berlaku untuk sebaliknya

---

> Note: Plugin ini telah di adaptasikan yang sebelumnya `_PR.CPU0` menjadi `_SB.PR00`
