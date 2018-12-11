#!/bin/bash
# Copyright 2018 Tero Karvinen http://TeroKarvinen.com GPL 3
sudo salt-call --local --file-root srv/salt/ --pillar-root srv/pillar/ state.highstate --state-output terse -l warning
