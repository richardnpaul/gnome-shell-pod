# Changelog of the GNOME Shell Podman Container

## [Version 20](https://github.com/Schneegans/gnome-shell-pod/tree/v20)

**Release Date:** 2026-10-16

#### Changes

- **Wayland Migration**: Switched the display architecture from legacy X11/Xvfb to a native headless Wayland session powered by Fedora's `gnome-headless-session@.service` and GDM headless session login.
- **Headless Virtual Monitor**: Enabled a persistent 1920x1080 virtual monitor on GNOME Shell so extensions and shell UI render headlessly without requiring a physical GPU.
- **Native Screenshots**: Added `screenshot.sh` helper which uses GNOME Shell's native `org.gnome.Shell.Screenshot` D-Bus interface, saving full resolution PNG images directly without requiring Xvfb framebuffer extraction or ImageMagick on the host.
- **JavaScript Evaluation & Automation**: Enabled GNOME Shell `--unsafe-mode` by default, allowing extension tests to evaluate JavaScript directly in the shell context via `org.gnome.Shell.Eval`.
- **Dynamic Extension Reloading**: Added `reload-extensions.sh` to rescan and load newly installed extensions dynamically without restarting the compositor.
- **Updated Environment & Wait Helpers**: Modernized `set-env.sh`, `wait-user-bus.sh`, and `wait-dbus-interface.sh` for Wayland and user session bus sockets with built-in timeouts to prevent hangs.
- **Automated CI Validation & Local Tooling**: Added local build and test scripts (`scripts/build.sh` and `scripts/test.sh`) to streamline local development and CI validation of container boot, session initialization, Wayland socket readiness, screenshot capture, and extension installation/enablement.
- **Automated Screenshot Capture**: Added `scripts/capture.sh` to automatically spin up a container and generate the 3 canonical preview images (`capture1.png`, `capture2.png`, and `capture3.png`), removing obsolete legacy captures.
- **Default Wallpapers & Apps**: Added `gnome-backgrounds` and `gnome-control-center` to the container images, ensuring the official default Adwaita desktop wallpaper is present out of the box.
- **Service Optimization & Stability**: Switched session and system bus to `dbus-daemon` to prevent inotify exhaustion crashes under rootless containers (`dbus-broker` fatal error -24). Masked unused background services (`NetworkManager`, `rtkit`, `tuned`, `localsearch-3`, `evolution-*`, and `pipewire`/`wireplumber`) to maximize boot speed and eliminate activation timeouts.
- **Image Matrix Update**: Added images for Fedora 42, 43, and 44 (featuring GNOME Shell 48, 49, and 50).
Older images (Fedora 32–40) are no longer rebuilt as GNOME has deprecated X11 and older releases lack native headless Wayland session infrastructure.

## [Version 19](https://github.com/Schneegans/gnome-shell-pod/tree/v19)

**Release Date:** 2024-11-06

#### Changes

- Fedora 41 has been added to the list of images.
- `xorg-x11-xinit` is now installed explicitly in the images as Fedora 41 does not include it anymore by default.
- The images for Fedora 36, 37, and 38 are not rebuilt anymore. They are still available, but they are not updated anymore.

## [Version 18](https://github.com/Schneegans/gnome-shell-pod/tree/v18)

**Release Date:** 2024-02-25

#### Changes

- Fedora 40 has been added to the list of images.
- The images for Fedora 32, 33, 34, and 35 are not rebuilt anymore. They are still available, but they are not updated anymore.

## [Version 17](https://github.com/Schneegans/gnome-shell-pod/tree/v17)

**Release Date:** 2023-11-09

#### Changes

- Fedora 39 has been added to the list of images.

## [Version 16](https://github.com/Schneegans/gnome-shell-pod/tree/v16)

**Release Date:** 2023-04-01

#### Changes

- Fedora 38 has been added to the list of images.
- There is now a `gnome-shell-pod-rawhide` container which is based on Fedora Rawhide an automatically rebuilt each week.

## [Version 15](https://github.com/Schneegans/gnome-shell-pod/tree/v15)

**Release Date:** 2022-12-31

#### Changes

- Fedora 37 has been added to the list of images.
- `gnome-terminal` is now included in the images.
- `ImageMagick` and the `find-target.sh` script have been removed.

## [Version 14](https://github.com/Schneegans/gnome-shell-pod/tree/v14)

**Release Date:** 2022-03-06

#### Changes

- The `XDG_SESSION_TYPE` variable is now set for the `gnome-shell` process also in the nested Wayland session.
- The `set-env.sh` script now uses `eval` instead of `exec` which allows executing more complex commands (for example including pipes) in the container.
- Added links to some in-depth guides to the README.
- This changelog was added.
- The default branch was renamed from `master` to `main`.
