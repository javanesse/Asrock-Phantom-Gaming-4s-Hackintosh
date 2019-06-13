Device (MCHC)
{
	Name (_ADR, 0x00000000)
	Method (_DSM, 4, NotSerialized)
	{
		If (LEqual (Arg2, Zero)) { Return (Buffer() { 0x03 } ) }
		Return (Package ()
		{
			"model", Buffer () { "8th Gen Core Processor Host Bridge/DRAM Registers" },
			"device_type", Buffer () { "Host bridge" },
			"AAPL,slot-name", Buffer () { "Internal" },
		})
	}
}
Device (IGPU)
{
	Name (_ADR, 0x00020000)
	Method (_DSM, 4, NotSerialized)
	{
		If (LEqual (Arg2, Zero)) { Return (Buffer() { 0x03 } ) }
		Return (Package ()
		{
			"AAPL,GfxYTile", Buffer () { 0x01, 0x00, 0x00, 0x00 },
			"framebuffer-con0-enable", Buffer () { 0x01, 0x00, 0x00, 0x00 },
			"framebuffer-portcount", Buffer () { 0x01, 0x00, 0x00, 0x00 },
			"framebuffer-con0-alldata", Buffer () { 0x01, 0x05, 0x09, 0x00, 0x00, 0x08, 0x00, 0x00, 0xC7, 0x03, 0x00, 0x00, 0xFF, 0x04, 0x0A, 0x00, 0x00, 0x04, 0x00, 0x00, 0xC7, 0x03, 0x00, 0x00, 0xFF, 0x06, 0x08, 0x00, 0x00, 0x04, 0x00, 0x00, 0xC7, 0x03, 0x00, 0x00 },
			"device-id", Buffer () { 0x9B, 0x3E, 0x00, 0x00 },
			"device_type", Buffer () { "VGA compatible controller" },
			"hda-gfx", Buffer () { "onboard-1" },
			"framebuffer-patch-enable", Buffer () { 0x01, 0x00, 0x00, 0x00 },
			"enable-hdmi20", Buffer () { 0x01, 0x00, 0x00, 0x00 },
			"AAPL,slot-name", Buffer () { "Internal" },
			"AAPL,ig-platform-id", Buffer () { 0x07, 0x00, 0x9B, 0x3E },
			"model", Buffer () { "???" },
			"framebuffer-unifiedmem", Buffer () { 0x00, 0x00, 0x00, 0x80 },
		})
	}
}
Device (pci8086,a379)
{
	Name (_ADR, 0x00120000)
	Method (_DSM, 4, NotSerialized)
	{
		If (LEqual (Arg2, Zero)) { Return (Buffer() { 0x03 } ) }
		Return (Package ()
		{
			"model", Buffer () { "Cannon Lake PCH Thermal Controller" },
			"device_type", Buffer () { "Signal processing controller" },
			"AAPL,slot-name", Buffer () { "Internal" },
		})
	}
}
Device (XHC)
{
	Name (_ADR, 0x00140000)
	Method (_DSM, 4, NotSerialized)
	{
		If (LEqual (Arg2, Zero)) { Return (Buffer() { 0x03 } ) }
		Return (Package ()
		{
			"model", Buffer () { "Cannon Lake PCH USB 3.1 xHCI Host Controller" },
			"device_type", Buffer () { "USB controller" },
			"AAPL,slot-name", Buffer () { "Internal" },
		})
	}
}
Device (pci8086,a36f)
{
	Name (_ADR, 0x00140002)
	Method (_DSM, 4, NotSerialized)
	{
		If (LEqual (Arg2, Zero)) { Return (Buffer() { 0x03 } ) }
		Return (Package ()
		{
			"model", Buffer () { "Cannon Lake PCH Shared SRAM" },
			"device_type", Buffer () { "RAM memory" },
			"AAPL,slot-name", Buffer () { "Internal" },
		})
	}
}
Device (IMEI)
{
	Name (_ADR, 0x00160000)
	Method (_DSM, 4, NotSerialized)
	{
		If (LEqual (Arg2, Zero)) { Return (Buffer() { 0x03 } ) }
		Return (Package ()
		{
			"model", Buffer () { "Cannon Lake PCH HECI Controller" },
			"device_type", Buffer () { "Communication controller" },
			"AAPL,slot-name", Buffer () { "Internal" },
		})
	}
}
Device (SATA)
{
	Name (_ADR, 0x00170000)
	Method (_DSM, 4, NotSerialized)
	{
		If (LEqual (Arg2, Zero)) { Return (Buffer() { 0x03 } ) }
		Return (Package ()
		{
			"model", Buffer () { "Cannon Lake PCH SATA AHCI Controller" },
			"device_type", Buffer () { "SATA controller" },
			"AAPL,slot-name", Buffer () { "Internal" },
		})
	}
}
Device (RP19)
{
	Name (_ADR, 0x001b0000)
	Method (_DSM, 4, NotSerialized)
	{
		If (LEqual (Arg2, Zero)) { Return (Buffer() { 0x03 } ) }
		Return (Package ()
		{
			"model", Buffer () { "Cannon Lake PCH PCI Express Root Port #19" },
			"device_type", Buffer () { "PCI bridge" },
			"AAPL,slot-name", Buffer () { "Internal" },
		})
	}
}
Device (LPCB)
{
	Name (_ADR, 0x001f0000)
	Method (_DSM, 4, NotSerialized)
	{
		If (LEqual (Arg2, Zero)) { Return (Buffer() { 0x03 } ) }
		Return (Package ()
		{
			"model", Buffer () { "Z390 Chipset LPC/eSPI Controller" },
			"device_type", Buffer () { "ISA bridge" },
			"AAPL,slot-name", Buffer () { "Internal" },
		})
	}
}
Device (HDEF)
{
	Name (_ADR, 0x001f0003)
	Method (_DSM, 4, NotSerialized)
	{
		If (LEqual (Arg2, Zero)) { Return (Buffer() { 0x03 } ) }
		Return (Package ()
		{
			"model", Buffer () { "Cannon Lake PCH cAVS" },
			"layout-id", Buffer () { 0x00, 0x00, 0x00, 0x00 },
			"hda-gfx", Buffer () { "onboard-1" },
			"AAPL,slot-name", Buffer () { "Internal" },
			"device_type", Buffer () { "Audio device" },
		})
	}
}
Device (SBUS)
{
	Name (_ADR, 0x001f0004)
	Method (_DSM, 4, NotSerialized)
	{
		If (LEqual (Arg2, Zero)) { Return (Buffer() { 0x03 } ) }
		Return (Package ()
		{
			"model", Buffer () { "Cannon Lake PCH SMBus Controller" },
			"device_type", Buffer () { "SMBus" },
			"AAPL,slot-name", Buffer () { "Internal" },
		})
	}
}
Device (pci8086,a324)
{
	Name (_ADR, 0x001f0005)
	Method (_DSM, 4, NotSerialized)
	{
		If (LEqual (Arg2, Zero)) { Return (Buffer() { 0x03 } ) }
		Return (Package ()
		{
			"model", Buffer () { "Cannon Lake PCH SPI Controller" },
			"device_type", Buffer () { "Serial bus controller" },
			"AAPL,slot-name", Buffer () { "Internal" },
		})
	}
}
Device (GLAN)
{
	Name (_ADR, 0x001f0006)
	Method (_DSM, 4, NotSerialized)
	{
		If (LEqual (Arg2, Zero)) { Return (Buffer() { 0x03 } ) }
		Return (Package ()
		{
			"model", Buffer () { "Ethernet Connection (7) I219-V" },
			"device_type", Buffer () { "Ethernet controller" },
			"AAPL,slot-name", Buffer () { "Internal" },
		})
	}
}
