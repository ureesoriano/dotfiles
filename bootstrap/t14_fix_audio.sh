sudo modprobe -r snd_rn_pci_acp3x
systemctl --user restart pulseaudio
sudo modprobe snd_rn_pci_acp3x
