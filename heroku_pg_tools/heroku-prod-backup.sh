#!/bin/bash

echo "please pass in the name of a file to dump to"

PGPASSWORD=nBpJ49QWtRkkTMTe2EU1wkaeRo pg_dump -Fc -n public --no-acl --no-owner -h ec2-54-243-179-9.compute-1.amazonaws.com -U oukevwqdgjxhjx d7e915je21h0g4 > $1
