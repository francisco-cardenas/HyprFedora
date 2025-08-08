<div align="center">

# 🚀 **HyprFedora – Automated Hyprland Installer for Fedora** 🚀

</div>

## 📢 About This Project
**HyprFedora** is an automated install script to set up [Hyprland](https://hyprland.org/) on Fedora, inspired by and forked from [JaKooLit/Fedora-Hyprland](https://github.com/JaKooLit/Fedora-Hyprland).  
It installs required packages, configures optional components (themes, login managers, utilities), and supports installing pre-configured Hyprland dotfiles from a separate repository.

While the **script structure** and **installation flow** follow the original project, this is a **standalone fork** maintained independently, with its own defaults and customizations.

---

## ⚠️ Important Notes
- This repo **does not** contain Hyprland dotfiles, but the installer **defaults to using my custom dotfiles** from [`HyprFedora-dots`](https://github.com/francisco-cardenas/HyprFedora-dots.git).  
  During installation, you can choose:
  1. My HyprFedora dotfiles (default)  
  2. JaKooLit’s Hyprland dotfiles  
  3. No dotfiles (vanilla Hyprland)
- This script is intended to be run on a **fresh install of Fedora Everything** with only the base system — **no desktop environment preinstalled**.
- NVIDIA users: remove `nouveau` before running this installer if you want proprietary drivers.
- Login managers: GDM and SDDM are supported. Others are not guaranteed to work.

---

## 📦 Customize Installation
Package lists and COPR repos can be edited before running:
- `install-scripts/00-hypr-pkgs.sh` → Core Hyprland & utility packages
- `install-scripts/copr.sh` → COPR repositories
- Other scripts in `install-scripts/` handle optional features

> **Note:** Removing certain packages may cause the included Hyprland dotfiles to break.

---

## 🔹 Installation

You can either **clone this repo manually** or use the quick bootstrap method.

### Option 1 – Quick Install (Bootstrap)
Run this command to automatically download and execute the installer:
```bash
bash -c "$(curl -fsSL https://raw.githubusercontent.com/francisco-cardenas/HyprFedora/main/auto-install.sh)"
```
> Requires `curl` to be installed.  
> Recommended for fresh Fedora Everything installs with no desktop environment.

---

### Option 2 – Manual Install
Clone this repo and run the main installer:
```bash
git clone --depth=1 https://github.com/francisco-cardenas/HyprFedora.git ~/.local/share/HyprFedora
cd ~/.local/share/HyprFedora
chmod +x install.sh
./install.sh
```

---

## 🔹 Reinstalling Specific Modules
You can rerun individual module scripts from the **project root**:
```bash
./install-scripts/gtk-themes.sh
./install-scripts/sddm.sh
```
> Do **not** `cd` directly into `install-scripts/` — scripts rely on relative paths.

---

## 🛠️ Post Install Recommendations
After installation, it’s recommended to review and update your settings using the configuration menu launched with:
```
SUPER + SHIFT + E
```
From this menu, you can:
- Adjust key settings and preferences for your environment.
- Enable **YubiKey support** for authentication.
- Add YubiKey support for decrypting **LUKS-encrypted drives** at boot.

---

## 🔹 Uninstallation
A guided `uninstall.sh` is provided, but use with caution — it may render your system unusable. Restoring from a snapshot is safer.

---

## 🙏 Credits
- **Hyprland** – [hyprland.org](https://hyprland.org/)
- **Original Fedora-Hyprland scripts** – [JaKooLit](https://github.com/JaKooLit/Fedora-Hyprland)

---

## 📜 License
This project is released under the same license as the original Fedora-Hyprland repo.  
Feel free to use, modify, and share — attribution is appreciated.


