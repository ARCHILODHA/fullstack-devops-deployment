#!/bin/bash

CONTAINER_NAME=$1

docker logs $CONTAINER_NAME --tail 50
