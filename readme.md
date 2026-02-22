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

---

## Installation

Clone the repository:

git clone https://github.com/netcatvr/NetCPUTempPlasmoid.git

Copy it into your local plasmoid directory:

mkdir -p ~/.local/share/plasma/plasmoids/
cp -r NetCPUTemp ~/.local/share/plasma/plasmoids/com.example.helloworld

Restart Plasma:

killall plasmashell && plasmashell --replace &

Then add it from **Add Widgets**.

---

## License

MIT
