#!/bin/sh
bl_dev=/sys/class/backlight/acpi_video0
step=5%

next_step_up () {
  amixer set Master ${step}+ > /dev/null
}

next_step_down () {
  amixer set Master ${step}- > /dev/null
}

toggle () {
  amixer set Master toggle > /dev/null
}

case $1 in
  -) next_step_down;;
  +) next_step_up;;
  x) toggle;;
esac

