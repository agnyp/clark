#!/bin/bash

export NUM_PROCESSES=0 && IDE_PROCESS_DISPATCHER=172.30.96.1:26162 rdebug-ide --host 0.0.0.0 --port 1234 -- /home/agnyp/.rvm/gems/ruby-2.6.3@optisure-rails5/bin/rails s
