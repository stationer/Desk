#!/bin/bash

rsync -rltv --exclude=.git --delete-excluded ../Graphite/ ./vendor/stationer/graphite/
rsync -rltv --exclude=.git --delete-excluded ../Barrel/ ./vendor/stationer/barrel/
rsync -rltv --exclude=.git --delete-excluded ../Pencil/ ./vendor/stationer/pencil/
rsync -rltvR --exclude=.git --delete src/init.php vendor/ lonefry@lonefry.com:dev.lonefry.com/
rsync -rltv --exclude=.git --exclude=vendor/ --delete src/ lonefry@lonefry.com:dev.lonefry.com/
