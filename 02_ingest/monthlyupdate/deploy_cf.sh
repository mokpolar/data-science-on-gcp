#!/bin/bash

URL=ingest_flights_niVoaO17vrqIL2c83hbdo7iQI4Jgf3ie
echo $URL

gcloud functions deploy $URL --runtime python37 --trigger-http --timeout 480s
