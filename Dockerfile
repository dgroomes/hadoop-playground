# Extend the AdoptOpenJDK Java 11 Debian Docker image. See https://hub.docker.com/r/adoptopenjdk/openjdk11/
FROM adoptopenjdk/openjdk11:debian

# Copy over the Hadoop package
COPY tmp/hadoop /opt/hadoop

# TODO Create an entrypoing and start hdfs. I don't know how to do this exactly because normally you would use
# 'start-dfs.sh' but that script exits. Normally a Docker container has a long-running process. But if 'start-dfs.sh' exits,
# then the container will exit. There are many approaches for handling this, but I don't know which to try first yet.
ENTRYPOINT ["echo", "Hello from the Hadoop Docker image!"]
