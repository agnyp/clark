#/bin/bash

set -e

# export DOMAIN=0.0.0.0:3030      # configure CMS and bind it to this address
export DOMAIN=localhost:3030    # configure CMS and bind it to this address
export SKIP_DEPENDENCIES=true   # you may want to skip installing gems, postgres, etc.
export DROP_DB=true             # drop previously created DB before (a must unless a first installation)
export APP_LOCALE=de            # configure app to run for a specific locale (e.g Austria)
# export CUSTOM_SEEDS=true        # configure app to run for a specific locale (e.g Austria)
export USE_LATEST_SEEDS=true    # setups seeds with production data
# export KEEP_LATEST_SEEDS=true   # setups seeds with production data

./bin/install
