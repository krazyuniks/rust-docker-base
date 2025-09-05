#!/bin/bash

# -l for lib
# -o output dir 
sea-orm-cli generate entity -u mysql://dbuser:password@database:3306/app -o mysql_repo/src/entity -v
