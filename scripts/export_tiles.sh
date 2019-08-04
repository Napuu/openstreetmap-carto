#!/bin/sh

# This script is used to start the import of kosmtik containers for the Docker development environment.
# You can read details about that in DOCKER.md

# Testing if database is ready
i=1
MAXCOUNT=60
echo "Waiting for PostgreSQL to be running"
while [ $i -le $MAXCOUNT ]
do
  pg_isready -q && echo "PostgreSQL running" && break
  sleep 2
  i=$((i+1))
done
test $i -gt $MAXCOUNT && echo "Timeout while waiting for PostgreSQL to be running"


# Downloading needed shapefiles
python scripts/get-shapefiles.py -n

# Creating default Kosmtik settings file
if [ ! -e ".kosmtik-config.yml" ]; then
cp /tmp/.kosmtik-config.yml .kosmtik-config.yml
fi
export KOSMTIK_CONFIGPATH=".kosmtik-config.yml"

# a few layers from whole world
mkdir -p /openstreetmap-carto/tiles
kosmtik export /openstreetmap-carto/project.mml --format tiles --output /openstreetmap-carto/tiles --minZoom 0 --maxZoom 6

# layers to 10 for europe
kosmtik export /openstreetmap-carto/project_europe.mml --format tiles --output /openstreetmap-carto/tiles --minZoom 7 --maxZoom 10

# and layers at finland from 0 to 18
# kosmtik export /openstreetmap-carto/project_finland.mml --format tiles --output /openstreetmap-carto/tiles --minZoom 0 --maxZoom 18