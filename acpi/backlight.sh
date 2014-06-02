#!/bin/sh
bl_dev=/sys/class/backlight/acpi_video0
max=100
step=10

bound () {
  if [ $1 -gt $max ]; then
    echo $max
    return
  fi

  if [ $1 -lt 1 ]; then
    echo 1
    return
  fi

  echo $1
}

next_step_up () {
  bound $(($(< $bl_dev/brightness) + $step))
}

next_step_down () {
  bound $(($(< $bl_dev/brightness) - $step))
}

toggle () {
  if [ $(< $bl_dev/brightness) -lt 1 ]; then
    echo $max
  else
    echo 0
  fi
}

case $1 in
  -) next_step_down >$bl_dev/brightness;;
  +) next_step_up >$bl_dev/brightness;;
  x) toggle >$bl_dev/brightness;;
esac

