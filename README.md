# Apple Hyprcursor

Open source and scalable Hyprcursor theme based on macOS.

All SVG files are from [_@ful1e5_](https://github.com/ful1e5)'s XCursor theme [here](https://github.com/ful1e5/apple_cursor).

---

## How to get it

Download the latest release from the [Release Page](https://github.com/6ooker/apple_hyprcursor/releases).

## Using the cursor theme

**Installation:**

```bash
tar -xvf macOS-hypr.tar.xz
mv macOS-hypr ~/.local/share/icons/
```

**Uninstallation:**

```bash
rm -r ~/.local/share/icons/macOS-hypr
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

For more info see https://wiki.hypr.land/Configuring/Environment-variables/

## Building from source

_Coming soon_

## Credit

[apple_cursor](https://github.com/ful1e5/apple_cursor)