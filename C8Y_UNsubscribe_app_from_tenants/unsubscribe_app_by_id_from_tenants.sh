#!/bin/bash
auth=$(sed '1q;d' configuration.conf)
app_id=$(sed '2q;d' configuration.conf)
input="tenants_list.conf"
while IFS= read -r tenant
do

	curl -X DELETE --header 'Content-Type: application/json' --header 'Accept: application/json' --header 'Authorization: Basic '$auth'' 'http://localhost/tenant/tenants/'$tenant'/applications/'$app_id''

echo 'Unsubscribing application with ID '$app_id' from tenant '$tenant' !'
sleep 1m
done < "$input"