#!/bin/bash

curl -H @curl_request "$(cat kenny_url)" > kenny.json
