#!/bin/bash
# Check the Server connection via nc

port=yourPortNumber
ip=yourIPServer
checkIntervalSecs=300
timeoutSecs=30
while true ; do
    if $(nc -z -v -w$timeoutSecs $ip $port &>/dev/null); then
        continue
    else
        curl -X POST "https://yourFlockWebhook" -H "Content-Type: application/json" -d '{"text" : "Your local machine cannot connect to the Server '$ip' via port '$port'"}'
    fi
    sleep $checkIntervalSecs
done