1. download correct `.pbf` file, 
    for example:

    `wget http://download.geofabrik.de/europe/finland-latest.osm.pbf -O data.osm.pbf`

2. make sure environment variables are correct at `docker-compose.yml`
3. `docker-compose up import` 
4. `docker-compose up export` (practically same image than `docker-compose up kosmtik`, but with different startup script)
5. do something with tiles