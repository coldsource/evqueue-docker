#!/bin/bash

if [[ ! -z ${node_desc} ]]
then
	sed -i -e "s/localhost:5001/${node_desc}/" /var/www/html/conf/cluster.json
fi

/usr/sbin/nginx
