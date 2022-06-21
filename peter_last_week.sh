#!/bin/bash

curl -H @curl_request "$(cat peter_url)" > peter.json
