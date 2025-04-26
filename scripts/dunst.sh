#!/bin/bash

pkill dunst && nohup dunst > /tmp/dunst.log 2>&1 &
