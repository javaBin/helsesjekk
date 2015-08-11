#!/usr/bin/env bash

. common.sh

check_curl_status "backend-api" "http://localhost:9003/healthcheck?pretty=true"
