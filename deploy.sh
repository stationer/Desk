#!/bin/bash

composer install
rsync -rltvR --exclude=.git/ --exclude=.idea/ --delete-excluded vendor/ $1
rsync -rltv --exclude=.git/ --exclude=.idea/ --exclude=vendor/ --delete src/ $1
