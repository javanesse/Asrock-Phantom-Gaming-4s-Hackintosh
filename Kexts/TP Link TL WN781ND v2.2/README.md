Khusus Kexts ini, terdapat 2 file, yaitu 
1. AtherosWiFiInjector.kext
2. IO80211Family.kext

Untuk `AtherosWiFiInjector.kext` silahkan tempatkan di `EFI > CLOVER > Kexts > Other`

namun untuk file `IO80211Family.kext` install menggunakan aplikasi [Easykext Utility](https://github.com/javanesse/Asrock-Phantom-Gaming-4s-Hackintosh/blob/master/usefull%20Apps/Easykext%20Utility.zip)

hal ini di karenakan TPlink TL WN781nd yang memiliki chipset Atheros AR945x tidak support untuk Mac OSX, maka dari itu di wajibkan mengganti file asli MAC OSX `IO80211Family.kext` menjadi file `IO80211Family.kext` yang sudah di patch
