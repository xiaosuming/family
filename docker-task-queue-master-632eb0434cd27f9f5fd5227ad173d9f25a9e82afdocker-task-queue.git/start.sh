#!/bin/bash

echo "starting task queue"; 
/usr/bin/python /usr/bin/supervisord -n -c /etc/supervisor/supervisord.conf &

/bin/bash