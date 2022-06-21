#!/bin/bash

curl -H @curl_request "$(cat kevin_url)" > kevin.json
