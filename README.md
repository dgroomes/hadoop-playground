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
personal computer. There is an open source project for running Hadoop in Docker: [`docker-hadoop`](https://github.com/big-data-europe/docker-hadoop).
This project uses `docker-hadoop` via a Git sub-module.

1. Clone the `docker-hadoop` repository sub-module
   * `TODO`
1. Start the Hadoop Docker containers
   * `TODO`
1. Execute a simple MapReduce job:
   * `TODO`

## TODO

This is an in-progress project. These are the TODO items:

* Do the "hello world" of Hadoop examples
  * I think this is the "grep" example touted on the official docs (see the *Hadoop: Setting up a Single Node Cluster.*
    link below)
* IN PROGRESS Use [docker-hadoop](https://github.com/big-data-europe/docker-hadoop) as a Git sub-module. This means we don't have to
  figure out how to put Hadoop in Docker! 

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
* [Hadoop official site: *Hadoop Cluster Setup*](https://hadoop.apache.org/docs/stable/hadoop-project-dist/hadoop-common/ClusterSetup.html)
* [Docker official site: *Run multiple services in a container*](https://docs.docker.com/config/containers/multi-service_container/)
* [Hadoop-in-Docker project `big-data-europe/docker-hadoop`](https://github.com/big-data-europe/docker-hadoop)
