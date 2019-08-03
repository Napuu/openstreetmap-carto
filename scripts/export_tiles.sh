export KOSMTIK_CONFIGPATH=".kosmtik-config.yml"
# a few layers from whole world
kosmtik export project.mml --output /tiles --minZoom 0 --maxZoom 6
# and layers at finland from 0 to 18
kosmtik export project_finland.mml --output /tiles --minZoom 0 --maxZoom 18