#!/bin/bash
set -x
sudo systemctl start redis-server
cd cartodb && bundle exec script/resque > /dev/null &
cd cartodb && bundle exec thin start --threaded -p 3000 --threadpool-size 5 &
cd CartoDB-SQL-API && node app.js development &
cd Windshaft-cartodb && node app.js development &