#!/bin/bash
. $HOME/.rvm/scripts/rvm
rvm env --path -- 3.0.0@default
cd /home/pi/pi-controller && bundle exec rails s >> /home/pi/pi-controller/log/startup.txt &
