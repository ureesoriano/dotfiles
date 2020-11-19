# 1. Create a systemd service that sets the fn mode as desired after reboot:
# cat /etc/systemd/system/keychron.service
[Unit]
Description=Fix Keychron K1v4 Fn keys lock

[Service]
Type=oneshot
ExecStart=/bin/bash -c "echo 0 > /sys/module/hid_apple/parameters/fnmode"

[Install]
WantedBy=multi-user.target

# 2. Run:
sudo systemctl enable keychron
