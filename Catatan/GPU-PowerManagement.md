Cara Mengecek GPU Power Management pada Hackintosh yaitu dengan mengetikkan AGPM pada ioregistry Explorer

Berikut contoh sebelum dan sesudah memiliki GPU Power Management

---

# Olarila

#### Sebelum
![Before](/Catatan/Resources/GPUPM-before.jpg)

#### Sesudah
![After](/Catatan/Resources/GPUPM-after.jpg)

[Source](https://www.olarila.com/topic/5974-agpminjector/)

---

# EliteMacX86

#### For AMD:

Look for AGPM under GFX0 node. The Heuristic-ID must be "ff ff ff ff" for AMD GPU.

![AMD](/Catatan/Resources/AMD-Heuristic-ID.png)

#### For NVIDIA:

Look for AGPM under GFX0 node. The Heuristic-ID must be "04 00 00 00" for NVIDIA GPU.

![NVidia](/Catatan/Resources/NVidia-Heuristic-ID.png)


[Source](https://www.elitemacx86.com/threads/how-to-enable-discrete-gpu-power-management-nvidia-amd.657/)

---

# This Config

Sementara untuk komputer ini sendiri, yang notabene menggunakan 2 buah GPU yaitu iGPU `Intel HD 630` dan dGPU `AMD RX Vega64` dengan sistem operasi BigSur memperlihatkan bahwa keduanya telah memiliki GPU Power Management yang baik.

![jvGPUPM](/Catatan/Resources/jvGPUPM.png)


