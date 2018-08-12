#!/bin/bash

rsync -rltv --exclude=.git --delete-excluded ../Graphite/src/ ./vendor/stationer/graphite/src/
rsync -rltv --exclude=.git --delete-excluded ../Barrel/src/ ./vendor/stationer/barrel/src/
rsync -rltv --exclude=.git --delete-excluded ../Pencil/src/ ./vendor/stationer/pencil/src/
rsync -rltvR --exclude=.git --delete src/init.php vendor/ lonefry@lonefry.com:dev.lonefry.com/
rsync -rltv --exclude=.git --exclude=vendor/ --delete src/ lonefry@lonefry.com:dev.lonefry.com/
