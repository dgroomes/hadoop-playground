# hadoop-playground

NOT YET IMPLEMENTED

📚 Learning and exploring core Apache Hadoop and its surrounding ecosystem.

> The Apache™ Hadoop® project develops open-source software for reliable, scalable, distributed computing.
>
>  -- <cite>https://hadoop.apache.org</cite>

## Instructions

This project makes use of Docker. Hadoop is a framework for distributed computing. As such, it's necessary to simulate
a distributed computing environment in order to effectively learn and explore Hadoop in its natural form. So, Docker to
the rescue. We can use Docker containers to virtualize computers and create a distributed environment all on our own
personal computer.

1. *Manually* download the Hadoop distribution:
    1. Follow download instructions on the [Hadoop download page](https://hadoop.apache.org/releases.html)
    1. Extract it with something likg:
       * `tar -xf hadoop-3.2.2.tar.gz`
    1. Create a directory named `tmp/`
    1. Move the downloaded and unzipped directory into `tmp/` and name it simply `hadoop` (you would have downloaded it
    1. Move the downloaded and unzipped directory into `tmp/` and name it simply `hadoop` (you would have downloaded it
       and extracted to a name like `hadoop-3.2.2`). It should look like this: `tmp/hadoop`.
1. Build the Hadoop Docker image:
   * `./build.sh`
1. Start the Hadoop Docker containers:
   * `docker run --rm hadoop-playground`
1. Execute a simple MapReduce job:
   * `TODO`

## TODO

This is an in-progress project. These are the TODO items:

* DONE Scaffold a Hadoop Docker image.
  * Note: I can find a couple somewhat populate Docker images from Docker but they are 2 and 4+ years old. Hadoop does
    not provide an official one. So, we will make our own. Download Hadoop, copy into a Debian (maybe?) Docker image
    and hope for the best.
* Run `hdfs` in the Docker container
* Do the "hello world" of Hadoop examples
  * I think this is the "grep" example touted on the official docs (see the *Hadoop: Setting up a Single Node Cluster.*
    link below)

## Wish List

General clean-ups, changes and things I wish to implement for this project:

* Sprinkle in Yarn somehow
  * Or is Yarn just implicitly there anyway if I run a Map Reduce job?
* Sprinkle in Oozie for scheduling
* Figure out secrets management.
  * I.e. figure out passwords files, file permissions and the "CredentialProvider" thing.

    
## Reference Materials

* [Hadoop official site: *Hadoop: Setting up a Single Node Cluster*](https://hadoop.apache.org/docs/stable/hadoop-project-dist/hadoop-common/SingleCluster.html)
* [Hadoop official site: *Download*](https://hadoop.apache.org/releases.html)
* [Docker official site: *Run multiple services in a container*](https://docs.docker.com/config/containers/multi-service_container/)
