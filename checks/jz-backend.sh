#!/usr/bin/env bash

. common.sh

check_curl_status "curl http://localhost:9003/healthcheck?pretty=true"
