#!/bin/bash
auth=$(sed '1q;d' configuration.conf)
app_id=$(sed '2q;d' configuration.conf)
input="tenants_list.conf"
while IFS= read -r tenant
do

  	curl -X POST --header 'Content-Type: application/json' --header 'Accept: application/json' --header 'Authorization: Basic '$auth'' -d '{ 
  	"application": { "id" : "'$app_id'" }
  	}' 'http://localhost/tenant/tenants/'$tenant'/applications'

echo "Subscribing IMPACT to "$tenant" tenant"
sleep 1m
done < "$input"