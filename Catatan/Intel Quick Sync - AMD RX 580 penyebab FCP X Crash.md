Ketika memasang kartu grafis berjenis [Sapphire Nitro AMD RX 580 8GB](https://www.sapphiretech.com/en/consumer/nitro-rx-580-8g-g5),
yang mana support OS X mojave 10.14.5 tanpa perlu `driver(kext`)` tambahan,
disini saya mengalami crash pada saat  melakukan editing video menggunaka Final Cut Pro X yang mana membuat komputer secara konstant melakukan restart.

Untuk mengatasi masalah ini, saya mengatur ulang `BIOS` pada bagian `Chipset Configuration > Primary Graphics Adapter`, menjadi `Onboard`,
sehingga dalam bagian `Graphics` pada `System Information`, menjadi 2 buah GPU yaitu Intel UHD 630 dan AMD RX 580.

![Primary Graphics Adapter](https://github.com/javanesse/Asrock-Phantom-Gaming-4s-Hackintosh/raw/master/Images/Asrock%20Phantom%20Gaming%204s/Bios%20Settings/3.jpg)
