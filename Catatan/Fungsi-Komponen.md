

---
SSDT-UIAC-ALL.aml = ???
		cra test=???

---
Lilu.kext
kext yang bertindak sebagai patcher dari beberapa kexts lainnya. secara gampang, lilu kext adalah bootloader dari kext lainnya

---
AppleALC.kext= sound untuk ALC 1220. 
Untuk Asrock Panthom Gaming 4s, wajib menambahkan lilu.kext dan bootarg= alcid=1

atau menggunakan clover device properties
PciRoot(0x0)/Pci(0x1f,0x3)
AAPL,slot-name Internal
device_type Audio device
layout-id 01000000 
model 100 Series/C230 Series Chipset Family HD Audio Controller

cara test = audio berfungsi normal


---
- IO80211Family.kext
- AtherosWiFiInjector.kext

kext wifi TPlink WN781ND alias Atheros AR945
untuk IO80211Family.kext, wajib di install di S/L/E, sedangkan AtherosWiFiInjector.kext boleh di EFI

cara test = wifi terdeteksi

---
FakeSMC.kext
kextwajib ang harus di install untuk bisa menginstall hackitosh dengan mengelabuhi SMC apple. Alternatif FakeAMC adalah VirtualSMC

---

IntelMausiEthernet.kext
kext lan ethernet yang terdapat pada Asrock Phantom Gaming 4s

System preference - network - ethernet terdeteksi

---
WhateverGreen.kext
Kext untuk memperbaiki VGA terutama intel denganb cara mengubah ig-platform-id. kext ini harus di sertai dengan LILU.kext.

Konfigurasi clover device poperties dalam Asrock panthom Gaming 4s dalah sebagai berikut
PciRoot(0x0)/Pci(0x2,0x0)
	AAPL,GfxYTile
		01000000 
			DATA
	AAPL,ig-platform-id
		07009B3E 
			DATA
	AAPL,slot-name
		Internal
			STRING
	device-id
		9B3E0000 
			DATA
	device_type
		VGA compatible controller
			STRING
	disable-external-gpu
		01000000 
			DATA
	enable-hdmi20
		01000000 
			DATA
	framebuffer-con0-alldata
		02020A00 00080000 C7030000 03040800 00080000 C7030000 FF010900 00040000 C7030000 
			DATA
	framebuffer-con0-enable
		01000000 
			DATA
	framebuffer-fbmem
		00009000 
			DATA
	framebuffer-patch-enable
		01000000 
			DATA
	framebuffer-portcount
		01000000 
			DATA
	framebuffer-stolenmem
		00003001 
			DATA
	framebuffer-unifiedmem
		00000080 
			DATA
	hda-gfx
		onboard-1
			STRING
	model
		UHD Graphics 630
			STRING

cara test= about this mac menunjukkan nilai memori vga dengan benar, tidak lag.

---
Native Power Management
To be clear, native power management is not mandatory. The consequences are not severe. Performance is similar, however, higher temps (~10 C), more power (5-10 W) and sleep problems are likely.
https://www.tonymacx86.com/threads/macos-native-cpu-igpu-power-management.222982/

Experimental option for Skylake/Kaby Lake (and later): HWP

In Skylake CPUs, Intel introduced a new power management technology: SpeedShift (aka. SST, aka. HWP).

With HWP enabled, the CPU handles pstate management by itself instead of requiring the OS to do it. The CPU itself will automatically shift to higher and lower pstates depending on CPU demand.

In order to use HWP, use an SMBIOS that is enabled for HWP... currently MacBook9,1, MacBookPro13,x (and now MacBookPro14,x, MacBookPro15,x). Also, since HWP tends to cause the xcpm_idle to be invoked, make sure the xcpm_idle patch (courtesy of PikeRAlpha) is enabled. It is default in all current plists provided by my Clover laptop guide. If you're using older than current plists, you may have to copy the patch into your config.plist/KernelAndKextPatches/KernelToPatch section.

You can also enable HWP for other SMBIOS by creating a patched resources injector for X86PlatformPlugin.kext (or by patching the kext itself). But that is a subject for another day.

Note: You still need SSDT.aml from ssdtPRgen.sh or SSDT-XCPM.aml as discussed earlier.
https://www.tonymacx86.com/threads/guide-native-power-management-for-laptops.175801/

SSDT-XCPM.aml = Native Power Management
		Cara test=???

alternatif tanpa SSD-XCPM.aml adalah menggunakan CPUFriend.kext yang harus di sertai dengan lilu.kext


Namun Asrock Phantom gaming 4s cukup Centang pluginType di clover config untuk dapat CPU dan GPU power management
cara cek = IOReg AGP dan x86PlatformPlugin muncul

---
CPUFriend.kext
Dynamic macOS CPU power management data injection. wajib menambahkan LILU.kext

---
KernelPm
No such thing as "AppleIntelCpuPM". I assume you mean "AppleIntelCPUPM" or "AsusAICPUPM" which are equivalent and only apply to Ivy Bridge or earlier.

And no such thing as "KernelPM". I assume you mean "KernelPm", which is required for Haswell and later if CPU MSR 0xE2 is locked.

And yes, no need for ssdtPRgen.sh generated SSDT. You only need SSDT-XCPM.aml and a correct SMBIOS.


Also, how can I tell if CPU MSR 0xE2 is locked?
Look at your Clover bootlog.
Note:
SPEEDY-NUC:~ rehabman$ bdmesg |grep 0xE2
0:103  0:000  MSR 0xE2 before patch 1E008008
0:103  0:000  MSR 0xE2 is locked, PM patches will be turned on


----

Fix AsRock Z390 BIOS DSDT Device(RTC) bug. If BIOS > 1.2 pada clover berguna untuk memperbaiki Real Time Clock yang merupakan bug pada mortherboard Asrock z390 mulai bios 1.2

Clover-ACPI-PATCHES
Comment: Fix AsRock Z390 BIOS DSDT Device(RTC) bug. If BIOS > 1.2
Find: A00A9353 54415301
Replace: A00A910A FF0BFFFF

cara test= jika tidak di masukkan, maka akan kernel panic NCT677XSensor: Started
---


