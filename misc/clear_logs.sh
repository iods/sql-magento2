#!/bin/bash

docker compose down

rm -rfv ./.docker/var/logs/*
rm -rfv ./.docker/var/data/*