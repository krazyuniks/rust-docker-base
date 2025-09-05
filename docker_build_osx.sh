#!/bin/bash

docker build --build-arg CARGO_HTTP_PROXY="http://host.docker.internal:8889" --build-arg CARGO_HTTPS_PROXY="http://host.docker.internal:8889" --build-arg http_proxy="http://host.docker.internal:8889" --build-arg https_proxy="http://host.docker.internal:8889" -t ryanlauterbach/rust-base .
