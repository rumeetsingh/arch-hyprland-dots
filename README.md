# Arch Linux Dotfiles

My personal Arch Linux configuration featuring **Hyprland** and **Noctalia Shell**, with custom configurations for the terminal, shell, GTK applications, Qt applications, and more.

## Overview

This repository contains my dotfiles, package lists, and other configuration assets to help me reproduce my Arch Linux environment after a fresh installation.

## Repository Structure

```text
.
├── config/
│   ├── fish/
│   ├── gtk-3.0/
│   ├── gtk-4.0/
│   ├── hypr/
│   ├── kitty/
│   ├── noctalia/
│   ├── nwg-look/
│   ├── qt5ct/
│   │   └── colors/
│   └── qt6ct/
│       └── colors/
├── icons/
│   └── arch.svg
├── aur-packages.txt
├── pkglist.txt
└── README.md
```

### Configurations

| Directory              | Description                       |
| ---------------------- | --------------------------------- |
| `config/fish/`         | Fish shell configuration          |
| `config/gtk-3.0/`      | GTK 3 application settings        |
| `config/gtk-4.0/`      | GTK 4 application settings        |
| `config/hypr/`         | Hyprland compositor configuration |
| `config/kitty/`        | Kitty terminal configuration      |
| `config/noctalia/`     | Noctalia Shell configuration      |
| `config/nwg-look/`     | GTK appearance settings           |
| `config/qt5ct/colors/` | Qt 5 color scheme                 |
| `config/qt6ct/colors/` | Qt 6 color scheme                 |
| `icons/`               | Repository assets and icons       |

### Package Lists

- **`pkglist.txt`** — explicitly installed packages from the official Arch Linux repositories.
- **`aur-packages.txt`** — foreign packages, including packages installed from the AUR.

These lists help reinstall software when setting up a fresh Arch Linux installation. They do not contain the actual package files or guarantee that every package will remain available.

## Installation

### 1. Install Arch Linux

Install Arch Linux and configure your user account, network, bootloader, and basic system.

### 2. Clone this repository

Install Git if necessary:

```bash
sudo pacman -S git
```

Clone the repository:

```bash
git clone <YOUR-REPOSITORY-URL>
cd <YOUR-REPOSITORY-NAME>
```

Replace the placeholders with your actual Git repository URL and directory name.

### 3. Install official repository packages

```bash
sudo pacman -Syu
sudo pacman -S --needed - < pkglist.txt
```

### 4. Install AUR packages

Install the prerequisites:

```bash
sudo pacman -S --needed base-devel git
```

Install an AUR helper such as `yay`, if needed, and then install the listed packages:

```bash
while IFS= read -r pkg; do
    [[ -z "$pkg" ]] && continue
    yay -S --needed "$pkg" || echo "Failed to install: $pkg"
done < aur-packages.txt
```

Review AUR build files and prompts before proceeding.

### 5. Restore dotfiles

The configurations are stored in the repository's `config/` directory rather than directly in `~/.config/`.

Copy them into your user's configuration directory:

```bash
mkdir -p ~/.config
cp -a config/. ~/.config/
```

**Warning:** Back up any existing configurations before copying. This command merges the repository's contents into `~/.config/` and may overwrite files with matching names.

### 6. Complete system configuration

Depending on your installation, you may also need to:

- Enable and configure required system services.
- Configure your display manager and login session.
- Restore wallpapers, fonts, cursors, and themes.
- Restore personal files and application data separately.
- Check hardware-specific settings and permissions.

## Updating Package Lists

Refresh the lists after installing or removing software:

```bash
pacman -Qqe > pkglist.txt
pacman -Qqem > aur-packages.txt
```

Commit and push the changes:

```bash
git add pkglist.txt aur-packages.txt
git commit -m "Update package lists"
git push
```

## Notes

- These dotfiles are tailored to my personal Arch Linux environment.
- Some settings may depend on installed packages, fonts, themes, hardware, or environment variables.
- Package lists restore package selections, not exact versions or the complete operating system.
- Back up important personal files separately.
- Never commit passwords, tokens, private SSH keys, or other sensitive information.

## Goals

- Keep my Arch Linux configuration version-controlled.
- Make rebuilding my Hyprland environment easier.
- Document my setup and learn how its components work.
- Maintain a reproducible and portable desktop configuration.

---

_Built with Arch Linux, Hyprland, and Noctalia Shell._
