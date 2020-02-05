#!/bin/bash

if [ "$#" -ne 4 ]; then
    echo "Usage: ./call_cf.sh  ds-on-gcp-mokpolar-test1 us-central1 ingest_flights_niVoaO17vrqIL2c83hbdo7iQI4Jgf3ie  niVoaO17vrqIL2c83hbdo7iQI4Jgf3ie"
    echo "   eg: ./call_cf.sh  cloud-training-demos-ml us-central1 ingest_flights_udwaxx86mVygAmOazUcijW8zBXWNxEVM  DI8TWPzTedNF0b3B8meFPxXSWw6m3bKG"
    exit
fi

PROJECT=$(gcloud config get-value project)
BUCKET=$1
REGION=$2
PATH=$3
TOKEN=$4

URL="https://${REGION}-${PROJECT}.cloudfunctions.net/${PATH}"

echo {\"year\":\"2015\"\,\"month\":\"03\"\,\"bucket\":\"${BUCKET}\", \"token\":\"${TOKEN}\"} > /tmp/message

/bin/cat /tmp/message

/Users/mokpolar/opt/anaconda3/bin/curl -X POST "https://${REGION}-${PROJECT}.cloudfunctions.net/$URL" -H "Content-Type:application/json" --data-binary @/tmp/message

