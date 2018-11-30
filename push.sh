#!/bin/bash

rsync -rltv --exclude=.git/ --delete-excluded ../Graphite/ ./vendor/stationer/graphite/
rsync -rltv --exclude=.git/ --delete-excluded ../Barrel/ ./vendor/stationer/barrel/
rsync -rltv --exclude=.git/ --delete-excluded ../Pencil/ ./vendor/stationer/pencil/
rsync -rltv --exclude=.git/ --delete-excluded ../LastWord/ ./vendor/stationer/lastword/
rsync -rltvR --exclude=.git/ --delete src/init.php vendor/ adamstafford@adam.lonefry.com:adam.lonefry.com/
rsync -rltv --exclude=.git/ --exclude=vendor/ --delete src/ adamstafford@adam.lonefry.com:adam.lonefry.com/
