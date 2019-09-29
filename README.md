# lakka-retroflag-safe-shutdown
Simple script to setup a safe shutdown on Lakka+RetroFlag

Works on NESPi and SNESPi cases.

# Install

## Enable SSH In Lakka

1. Connect rPi to internet
2. Boot up Lakka
3. Config -> Services -> SSH Enable -> On


## Install scripts

```bash
scp <repo> root@<rpi>:/tmp/safe-shutdown
ssh root@<rpi> cd /tmp/safe-shutdown && bash install.sh
```


# Credits

This is pretty much a cleaned up version of:

- <https://github.com/thiagoauler/lakka_nespi_power>
- <https://github.com/marcelonovaes/lakka_nespi_power>


Inspired by:

- <https://github.com/RetroFlag/retroflag-picase>

Uses the RPi.GPIO module
(<https://sourceforge.net/projects/raspberry-gpio-python/>). The one embedded
seems to be 0.5.11, compiled for Python 2.7.
