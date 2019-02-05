#!/bin/bash

# A script for pushing changes to an already deployed site

# Grab latest Graphite code from sister repo
rsync -rltv --exclude=.git/ --delete-excluded ../Graphite/ ./vendor/stationer/graphite/

# Grab latest Barrel code from sister repo
rsync -rltv --exclude=.git/ --delete-excluded ../Barrel/ ./vendor/stationer/barrel/

# Grab latest Pencil code from sister repo, and associated assets from Letterhead and SortTable
rsync -rltv --exclude=.git/ --delete-excluded ../Letterhead/public/ ../Pencil/node_modules/letterhead/public/
rsync -rltv --exclude=.git/ --delete-excluded ../Letterhead/public/css/app.css ../Pencil/src/css/letterhead.css
rsync -rltv --exclude=.git/ --delete-excluded ../Letterhead/public/js/app.js ../Pencil/src/js/letterhead.js
rsync -rltv --exclude=.git/ --delete-excluded ../SortTable/sort-table.min.js ../Pencil/src/js/oksort.js
rsync -rltv --exclude=.git/ --delete-excluded ../Chalk/src/ ../Pencil/node_modules/ok-chalk/src/
rsync -rltv --exclude=.git/ --delete-excluded ../Pencil/ ./vendor/stationer/pencil/

# Grab latest LastWord code from sister repo, and associated assets from Letterhead
rsync -rltv --exclude=.git/ --delete-excluded ../Letterhead/public/js/app.js ../LastWord/src/js/letterhead.js
rsync -rltv --exclude=.git/ --delete-excluded ../Letterhead/public/css/app.css ../LastWord/src/css/letterhead.css
rsync -rltv --exclude=.git/ --delete-excluded ../LastWord/ ./vendor/stationer/lastword/
<<<<<<< HEAD
rsync -rltvR --exclude=.git/ --delete src/init.php vendor/ adamstafford@adam.lonefry.com:adam.lonefry.com/
rsync -rltv --exclude=.git/ --exclude=vendor/ --delete src/ adamstafford@adam.lonefry.com:adam.lonefry.com/
=======

# rsync latest code up to specified host
rsync -rltvR --exclude=.git/ --exclude=.idea/ --delete-excluded --delete vendor/ $1
rsync -rltv --exclude=.git/ --exclude=p.uploads/ --exclude=P_Cache/ --exclude=vendor/ --delete src/ $1
>>>>>>> f9b2c0ea67782cdde69e33697fc3bb4db7aaa098
