#!/bin/bash

rsync -rltv --exclude=.git --delete-excluded ../Graphite/src/ ./vendor/stationer/graphite/src/
rsync -rltv --exclude=.git --delete-excluded ../Barrel/src/ ./vendor/stationer/barrel/src/
rsync -rltv --exclude=.git --delete-excluded ../Pencil/src/ ./vendor/stationer/pencil/src/
rsync -rltvR --exclude=.git --delete src/ vendor/ lonefry@lonefry.com:dev.lonefry.com/
