Cara Mengecek GPU Power Management pada Hackintosh yaitu dengan mengetikkan AGPM pada ioregistry Explorer

Berikut contoh sebelum dan sesudah memiliki GPU Power Management

## Sebelum
![Before](/Catatan/Resources/GPUPM-before.jpg)

## Sesudah
![After](/Catatan/Resources/GPUPM-after.jpg)

[Source](https://www.olarila.com/topic/5974-agpminjector/)

---

#### For AMD:

Look for AGPM under GFX0 node. The Heuristic-ID must be "ff ff ff ff" for AMD GPU.

#### For NVIDIA:

Look for AGPM under GFX0 node. The Heuristic-ID must be "04 00 00 00" for NVIDIA GPU.

[Source](https://www.elitemacx86.com/threads/how-to-enable-discrete-gpu-power-management-nvidia-amd.657/)

