# cwings
curl added to the Pterodactyl Panel Wings image for purposes of enabling an internal healthcheck

### Supported Architectures
| Architecture | Support Status |
|--------------|---------------|
| AMD64        | :white_check_mark: Supported   |
| ARM64        | :white_check_mark: Supported   |

- Note: While Wings (and this version of Wings with curl added) will run fine on Arm64, most game servers _will not_, so if you are running Wings on an Arm64 machine, that's something to be aware of.
- If running Wings on a Rasberry Pi, see the following section posted by quintenqvd in the Pterodactyl Discord:
  > Running wings on a pi 4 or 5
  > Wings require docker cgroups. Those are not present in the ubuntu version only in the debian 11 or 12 one
  > install the debian lite 64 bit OS
  > Install docker then open the /boot/cmdline.txt file and add (don't remove anything and do not add a new line)  cgroup_memory=1 cgroup_enable=memory systemd.unified_cgroup_hierarchy=0 to the end of what is already there, save + exit and then restart
  > Note on the debian 12 based os the path is /boot/firmware/cmdline.txt

## Image names
### Latest (recommended)
- v1.12.1
  ```
  ghcr.io/loki-101/cwings:v1.12.1
  ```

### Old
- v1.11.0
  `ghcr.io/loki-101/cwings:v1.11.0`
- v1.11.1
  `ghcr.io/loki-101/cwings:v1.11.1`
- v1.11.2
  `ghcr.io/loki-101/cwings:v1.11.2`
- v1.11.3
  `ghcr.io/loki-101/cwings:v1.11.3`
- v1.11.4
  `ghcr.io/loki-101/cwings:v1.11.4`
- v1.11.5
  `ghcr.io/loki-101/cwings:v1.11.5`
- v1.11.6
  `ghcr.io/loki-101/cwings:v1.11.6`
- v1.11.7
  `ghcr.io/loki-101/cwings:v1.11.7`
- v1.11.8
  `ghcr.io/loki-101/cwings:v1.11.8`
- v1.11.9
  `ghcr.io/loki-101/cwings:v1.11.9`
- v1.11.10
  `ghcr.io/loki-101/cwings:v1.11.10`
- v1.11.11
  `ghcr.io/loki-101/cwings:v1.11.11`
- v1.11.12
  `ghcr.io/loki-101/cwings:v1.11.12`
- v1.11.13
  `ghcr.io/loki-101/cwings:v1.11.13`
- v1.12.0
  `ghcr.io/loki-101/cwings:v1.12.0`
