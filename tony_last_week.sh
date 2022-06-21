#!/bin/bash

curl -H @curl_request "$(cat tony_url)" > tony.json
