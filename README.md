# Apple Hyprcursor

Open source and scalable Hyprcursor theme based on macOS.

All SVG files are from [_@ful1e5_](https://github.com/ful1e5)'s XCursor theme [here](https://github.com/ful1e5/apple_cursor).

---

## How to get it

Download the latest release from the [Release Page](https://github.com/6ooker/apple_hyprcursor/releases).

## Using the cursor theme

**Installation:**

```bash
tar -xvf macOS-hypr.tar.xz              # Unpack archive
mv macOS-hypr ~/.local/share/icons/     # Install to local user
sudo mv macOS-hypr /usr/share/icons/    # Install to all users
```

**Uninstallation:**

```bash
rm -r ~/.local/share/icons/macOS-hypr   # Remove from local user
sudo rm -r /usr/share/icons/macOS-hypr  # Remove from all users
```

**Usage:**

Inside your `hyprland.conf` file:

```bash
env = HYPRCURSOR_THEME,macOS-hypr
env = HYPRCURSOR_SIZE,28                # Or any size you like
```

Or via _CLI_:

```bash
hyprctl setcursor macOS-hypr,28
```

For more info see the [Hyprland wiki](https://wiki.hypr.land/Hypr-Ecosystem/hyprcursor/#hyprcursor-themes)

## Building from source

### Prerequisites

- [Hyprcursor](https://github.com/hyprwm/hyprcursor#tools) >= 0.1.1

### Quick Start

1. Get [dependencies](#prerequisites)
2. `git clone https://github.com/6ooker/apple_hyprcursor`
3. `cd apple_hyprcursor`
4. `./build.sh`
5. See [installation](#using-the-cursor-theme)

### Changing color

The `build.sh` script provides two options for changing color:
1. `-b`: Background color, replaces `#0000FF` in the SVG.
2. `-f`: Foreground color, replaces `#00FF00` in the SVG.

```bash
./build.sh -b '<hex>' -f '<hex>'
```

No options will result in default, which is `#FFFFFF` for `-b` and `#000000` for `-f`.

## Credit

[apple_cursor](https://github.com/ful1e5/apple_cursor)
