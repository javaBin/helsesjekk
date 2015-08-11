#!/usr/bin/env bash

. common.sh

check_curl_status "http://localhost:9003/healthcheck?pretty=true"
