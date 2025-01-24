# Enable Touchpad Tapping

This Bash script enables touchpad tapping in Linux.  
It is useful for cases where the system fails to recognize the touchpad correctly on startup, preventing tap-to-click from working.  

## Installation & Usage

1. Save the script as `enable-touchpad.sh`.
2. Make it executable:  
   ```bash
   chmod +x enable-touchpad.sh
   ```

3. Run it manually:
   ```bash
   ./enable-touchpad.sh
   ```

## Autostart

To run the script automatically on system startup, add it to autostart. For example:

- **Using `~/.xprofile` (for X11):**  
  Add the following line to your `~/.xprofile` file:
  ```bash
  ~/enable-touchpad.sh &
  ```

- **Using `systemd` (recommended, works universally):**
  1. Create a systemd service file at `~/.config/systemd/user/enable-touchpad.service`:
     ```ini
     [Unit]
     Description=Enable Touchpad Tapping
     After=graphical.target

     [Service]
     ExecStart=/path/to/enable-touchpad.sh
     Restart=always
     User=%u

     [Install]
     WantedBy=default.target
     ```

  2. Enable and start the service:
     ```bash
     systemctl --user enable enable-touchpad.service
     systemctl --user start enable-touchpad.service
     ```

## Requirements

- A system with `xinput` (usually included with X11).
- A Linux distribution with an X server (tested on Manjaro KDE).

## Why is this needed?

On some laptops (e.g., HP), Linux may fail to properly initialize the touchpad on startup, causing tap-to-click to be disabled until manually enabled.  
This script automatically detects the touchpad, retrieves its ID, and enables `libinput Tapping Enabled`.

## License

This script is released under the MIT License. Use at your own risk.
