

Sumber|
------|
https://www.tonymacx86.com/threads/success-8700k-gigabyte-z370-hd3p-uhd-graphics-630-macos-high-sierra-mojave.239402/|
https://www.tonymacx86.com/threads/guide-patching-laptop-dsdt-ssdts.152573/|

Versi OS         | smbios
-----------------|--------------
Mojave 10.4.5    | iMac 19.2 



#Metode pengambilan ACPI
extract dsdt f4
======

https://www.tonymacx86.com/threads/guide-patching-laptop-dsdt-ssdts.152573/
Note: With newer ACPI sets (generally Skylake and later), the ACPI files have been compiled with a new enough version of iasl that embeds External opcodes in the resulting AML code. For these newer ACPI sets, no need for -da and especially not refs.txt as the refs.txt content here may conflict with the embedded External opcodes.

jadi tanpa refs.txt tanpa -da
iasl -dl DSDT.aml SSDT*.aml

patches only DSDT from maciasl
"RENAME _DSM to XDM"
"Fix _WAK Arg0 v2"
"HPET Fix"
"SMBUS Fix"
"IRQ Fix"
"RTC Fix"
"OS Check Fix"
"Fix Mutex with non-zero SyncLevel"
"Add MCHC"

Search All DSDT and SSDT and replace : grep -l _DSM *.dsl
"RENAME _DSM to XDM"
"HECI to IMEI"
"SAT0 to SATA"
"HDAS to HDEF"
"GFX0 to IGPU"
