#!/bin/bash

rsync -rltv --exclude=.git --delete-excluded ../Graphite/src/ lonefry@lonefry.com:dev.lonefry.com/vendor/stationer/graphite/src/
rsync -rltv --exclude=.git --delete-excluded ../Barrel/src/ lonefry@lonefry.com:dev.lonefry.com/vendor/stationer/barrel/src/ 
rsync -rltv --exclude=.git --delete-excluded ../Pencil/src/ lonefry@lonefry.com:dev.lonefry.com/vendor/stationer/pencil/src/ 
rsync -rltv --exclude=vendor --delete src/ lonefry@lonefry.com:dev.lonefry.com/
