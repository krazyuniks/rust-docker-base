#!/bin/bash

docker build --build-arg CARGO_HTTPS_PROXY=$HTTP_PROXY --build-arg https_proxy="$HTTP_PROXY" -t rust-docker-base .
