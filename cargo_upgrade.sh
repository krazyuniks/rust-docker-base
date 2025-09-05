#!/bin/sh

cargo +nightly outdated

cargo +nightly upgrade -i allow && cargo +nightly update

cargo +nightly outdated
