#!/bin/bash

echo "Starting web server"
echo
echo "--------------------------------"
echo
echo "On Mac use Safari to access the web server"
echo
echo "--------------------------------"
echo

# env vars are loaded by docker-compose from the .env file, so we don't need to set
echo "running cargo watch"
RUSTFLAGS="-Z threads=8 -C link-arg=-fuse-ld=/usr/local/bin/mold" RUST_LOG=web=debug,tower_http=debug cargo watch -x 'run -p web'
