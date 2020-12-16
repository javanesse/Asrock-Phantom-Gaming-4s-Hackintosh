/*
 * Intel ACPI Component Architecture
 * AML/ASL+ Disassembler version 20200925 (64-bit version)
 * Copyright (c) 2000 - 2020 Intel Corporation
 * 
 * Disassembling to non-symbolic legacy ASL operators
 *
 * Disassembly of /Users/javanesse/Desktop/origin copy/SSDT-x1_2-Cpu0Cst.aml, Thu Dec 17 01:45:40 2020
 *
 * Original Table Header:
 *     Signature        "SSDT"
 *     Length           0x00000400 (1024)
 *     Revision         0x02
 *     Checksum         0xD9
 *     OEM ID           "PmRef"
 *     OEM Table ID     "Cpu0Cst"
 *     OEM Revision     0x00003001 (12289)
 *     Compiler ID      "INTL"
 *     Compiler Version 0x20160527 (538314023)
 */
DefinitionBlock ("", "SSDT", 2, "PmRef", "Cpu0Cst", 0x00003001)
{
    External (_SB_.C3LT, FieldUnitObj)
    External (_SB_.C3MW, FieldUnitObj)
    External (_SB_.C6LT, FieldUnitObj)
    External (_SB_.C6MW, FieldUnitObj)
    External (_SB_.C7LT, FieldUnitObj)
    External (_SB_.C7MW, FieldUnitObj)
    External (_SB_.CDLT, FieldUnitObj)
    External (_SB_.CDLV, FieldUnitObj)
    External (_SB_.CDMW, FieldUnitObj)
    External (_SB_.CDPW, FieldUnitObj)
    External (_SB_.CFGD, FieldUnitObj)
    External (_SB_.PR00, DeviceObj)
    External (C3LT, UnknownObj)
    External (C3MW, UnknownObj)
    External (C6LT, UnknownObj)
    External (C6MW, UnknownObj)
    External (C7LT, UnknownObj)
    External (C7MW, UnknownObj)
    External (CDLT, UnknownObj)
    External (CDLV, UnknownObj)
    External (CDMW, UnknownObj)
    External (CDPW, UnknownObj)
    External (CFGD, UnknownObj)
    External (FEMD, UnknownObj)
    External (FMBL, UnknownObj)
    External (PC00, UnknownObj)
    External (PFLV, UnknownObj)
    External (PWRS, UnknownObj)

    Scope (\_SB.PR00)
    {
        Name (C1TM, Package (0x04)
        {
            ResourceTemplate ()
            {
                Register (FFixedHW, 
                    0x00,               // Bit Width
                    0x00,               // Bit Offset
                    0x0000000000000000, // Address
                    ,)
            }, 

            One, 
            One, 
            0x03E8
        })
        Name (C3TM, Package (0x04)
        {
            ResourceTemplate ()
            {
                Register (SystemIO, 
                    0x08,               // Bit Width
                    0x00,               // Bit Offset
                    0x0000000000001814, // Address
                    ,)
            }, 

            0x02, 
            Zero, 
            0x01F4
        })
        Name (C6TM, Package (0x04)
        {
            ResourceTemplate ()
            {
                Register (SystemIO, 
                    0x08,               // Bit Width
                    0x00,               // Bit Offset
                    0x0000000000001815, // Address
                    ,)
            }, 

            0x02, 
            Zero, 
            0x015E
        })
        Name (C7TM, Package (0x04)
        {
            ResourceTemplate ()
            {
                Register (SystemIO, 
                    0x08,               // Bit Width
                    0x00,               // Bit Offset
                    0x0000000000001816, // Address
                    ,)
            }, 

            0x02, 
            Zero, 
            0xC8
        })
        Name (CDTM, Package (0x04)
        {
            ResourceTemplate ()
            {
                Register (SystemIO, 
                    0x08,               // Bit Width
                    0x00,               // Bit Offset
                    0x0000000000001816, // Address
                    ,)
            }, 

            0x03, 
            Zero, 
            Zero
        })
        Name (MWES, ResourceTemplate ()
        {
            Register (FFixedHW, 
                0x01,               // Bit Width
                0x02,               // Bit Offset
                0x0000000000000000, // Address
                0x01,               // Access Size
                )
        })
        Name (AC2V, Zero)
        Name (AC3V, Zero)
        Name (C3ST, Package (0x04)
        {
            0x03, 
            Package (0x00){}, 
            Package (0x00){}, 
            Package (0x00){}
        })
        Name (C2ST, Package (0x03)
        {
            0x02, 
            Package (0x00){}, 
            Package (0x00){}
        })
        Name (C1ST, Package (0x02)
        {
            One, 
            Package (0x00){}
        })
        Name (CSTF, Zero)
        Method (_CST, 0, Serialized)  // _CST: C-States
        {
            If (LNot (CSTF))
            {
                Store (C3LT, Index (C3TM, 0x02))
                Store (C6LT, Index (C6TM, 0x02))
                Store (C7LT, Index (C7TM, 0x02))
                Store (CDLT, Index (CDTM, 0x02))
                Store (CDPW, Index (CDTM, 0x03))
                Store (CDLV, Index (DerefOf (Index (CDTM, Zero)), 0x07))
                If (LAnd (And (CFGD, 0x0800), And (PC00, 0x0200)))
                {
                    Store (MWES, Index (C1TM, Zero))
                    Store (MWES, Index (C6TM, Zero))
                    Store (MWES, Index (C7TM, Zero))
                    Store (MWES, Index (CDTM, Zero))
                    Store (MWES, Index (C3TM, Zero))
                    Store (C3MW, Index (DerefOf (Index (C3TM, Zero)), 0x07))
                    Store (C6MW, Index (DerefOf (Index (C6TM, Zero)), 0x07))
                    Store (C7MW, Index (DerefOf (Index (C7TM, Zero)), 0x07))
                    Store (CDMW, Index (DerefOf (Index (CDTM, Zero)), 0x07))
                }
                ElseIf (LAnd (And (CFGD, 0x0800), And (PC00, 0x0100)))
                {
                    Store (MWES, Index (C1TM, Zero))
                }

                Store (Ones, CSTF) /* \_SB_.PR00.CSTF */
            }

            Store (Zero, AC2V) /* \_SB_.PR00.AC2V */
            Store (Zero, AC3V) /* \_SB_.PR00.AC3V */
            Store (C1TM, Index (C3ST, One))
            If (And (CFGD, 0x20))
            {
                Store (C7TM, Index (C3ST, 0x02))
                Store (Ones, AC2V) /* \_SB_.PR00.AC2V */
            }
            ElseIf (And (CFGD, 0x10))
            {
                Store (C6TM, Index (C3ST, 0x02))
                Store (Ones, AC2V) /* \_SB_.PR00.AC2V */
            }
            ElseIf (And (CFGD, 0x08))
            {
                Store (C3TM, Index (C3ST, 0x02))
                Store (Ones, AC2V) /* \_SB_.PR00.AC2V */
            }

            If (And (CFGD, 0x4000))
            {
                Store (CDTM, Index (C3ST, 0x03))
                Store (Ones, AC3V) /* \_SB_.PR00.AC3V */
            }

            If (LAnd (AC2V, AC3V))
            {
                Return (C3ST) /* \_SB_.PR00.C3ST */
            }
            ElseIf (AC2V)
            {
                Store (DerefOf (Index (C3ST, One)), Index (C2ST, One))
                Store (DerefOf (Index (C3ST, 0x02)), Index (C2ST, 0x02))
                Return (C2ST) /* \_SB_.PR00.C2ST */
            }
            ElseIf (AC3V)
            {
                Store (DerefOf (Index (C3ST, One)), Index (C2ST, One))
                Store (DerefOf (Index (C3ST, 0x03)), Index (C2ST, 0x02))
                Store (0x02, Index (DerefOf (Index (C2ST, 0x02)), One))
                Return (C2ST) /* \_SB_.PR00.C2ST */
            }
            Else
            {
                Store (DerefOf (Index (C3ST, One)), Index (C1ST, One))
                Return (C1ST) /* \_SB_.PR00.C1ST */
            }
        }
    }
}

