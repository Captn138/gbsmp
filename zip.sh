#!/usr/bin/env bash

rm -f server.zip client.zip
cd server
zip -r ../server.zip ./*
cd ../client
zip -r ../client.zip ./*
