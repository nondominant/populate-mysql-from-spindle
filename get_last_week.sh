#!/bin/bash

curl -H @curl_request "$(cat louis_url)" > louis.json
