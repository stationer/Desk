#!/bin/bash

composer update
rsync -rltvR --exclude=.git --delete-excluded vendor/ lonefry@lonefry.com:dev.lonefry.com/
rsync -rltv --exclude=vendor --delete src/ lonefry@lonefry.com:dev.lonefry.com/ 
