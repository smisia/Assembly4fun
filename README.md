# Assembly4fun
This repo contains my assembly practices on a PI4 (BCM2711 SoC chip which has a quad-core 64-bit ARM Cortex-A72 CPU)

The "helloworld" is a basic starter program to print hello world in the terminal.

I also created the gpio_set program which sets the GPIO 26 pin to high which was connected to a simple LED to make it light up.
The mmap_gpio.c file is used to grant access to the physical memory addresses to allow me to work with them [it should be linked together with the target program!].
