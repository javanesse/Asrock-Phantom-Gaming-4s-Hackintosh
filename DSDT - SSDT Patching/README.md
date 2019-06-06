

Sumber|
------|
https://www.tonymacx86.com/threads/success-8700k-gigabyte-z370-hd3p-uhd-graphics-630-macos-high-sierra-mojave.239402/|
https://www.tonymacx86.com/threads/guide-patching-laptop-dsdt-ssdts.152573/|


Versi OS     | Mojave 10.4.5
smbios       | iMac 19.2

extract dsdt f4
======

disassmbly only dsdt and ssdt using refs.txt


refs.txt>>
External(MDBG, MethodObj, 1)
External(_SB.PCI0.LPCB.H_EC.ECWT, MethodObj, 2)
External(_SB.PCI0.LPCB.H_EC.ECRD, MethodObj, 1)
External(_SB.PCI0.LPCB.H_EC.ECMD, MethodObj, 1)
External(_SB.PCI0.PEG0.PEGP.SGPO, MethodObj, 2)
External(_SB.PCI0.GFX0.DD02._BCM, MethodObj, 1)
External(_SB.PCI0.SAT0.SDSM, MethodObj, 4)
External(_GPE.VHOV, MethodObj, 3)
External(_SB.PCI0.XHC.RHUB.TPLD, MethodObj, 2)


iasl -dl -fe refs.txt DSDT.aml SSDT*.aml

no -da option for skylake or later

=====
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


NEW:

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
