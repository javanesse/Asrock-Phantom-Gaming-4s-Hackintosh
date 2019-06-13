SSDT tambahan untuk CPU Power Management

* `SSDT-PluginType1` ini merupakan pengganti dari `PluginType` yang ada di clover
* Dengan `SSDT-PluginType1` ini, maka tidak perlu lagi untuk memberikan tanda centang pada `PluginType` pada Clover sehingga clover lebih bersih

> SSDT-PluginType1.aml will require edits to work with your ACPI.
> (your Processor objects are not at _PR.CPU0... look at your DSDT and you'll see).
> Probably it is easier to use config.plist/ACPI/SSDT/Generate/PluginType=true.

dari keterangan [di atas](https://www.tonymacx86.com/threads/macos-native-cpu-igpu-power-management.222982/page-52), menunjukkan bahwa
