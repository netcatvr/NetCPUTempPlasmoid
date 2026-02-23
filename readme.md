# NetCPUTemp Widget

A minimal KDE Plasma 6 widget that displays your CPU package temperature in real time.

![image](https://data.netcat.moe/netshot_1771783308_b8f6993a292c7cee.png)

---

## What it does

- Reads CPU package temperature via `lm_sensors`
- Renders it nicely with a nice modern font

---

## Requirements

- KDE Plasma 6
- `lm_sensors` installed and configured

On Arch / EndeavourOS:

sudo pacman -S lm_sensors  
sudo sensors-detect

## ⚠️ Important (CPU Sensor Module)

If the widget shows nothing, your CPU temperature kernel module may not be loaded.

### Intel CPUs

Load the `coretemp` module manually:

```bash
sudo modprobe coretemp
```

To make it load automatically on boot:

```bash
echo coretemp | sudo tee /etc/modules-load.d/coretemp.conf
```

Verify it works:

```bash
sensors
```

You should see a line similar to:

```
Package id 0:  +37.0°C
```

---

### AMD CPUs

If you're on AMD and no temperature appears, try loading:

```bash
sudo modprobe k10temp
```

Then verify again with:

```bash
sensors
```


---

## Installation

Clone the repository:

``git clone https://github.com/netcatvr/NetCPUTempPlasmoid.git``

Copy it into your local plasmoid directory:

``mkdir -p ~/.local/share/plasma/plasmoids/``

``cp -r NetCPUTemp ~/.local/share/plasma/plasmoids/com.example.helloworld``

Restart Plasma:

``killall plasmashell && plasmashell --replace &``

Then add it from **Add Widgets**.

---

## License

MIT
