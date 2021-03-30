# hadoop-playground

NOT YET FULLY IMPLEMENTED

📚 Learning and exploring core Apache Hadoop and its surrounding ecosystem.

> The Apache™ Hadoop® project develops open-source software for reliable, scalable, distributed computing.
>
>  -- <cite>https://hadoop.apache.org</cite>

## Pre-requisites

* Docker
* Java 11

## Instructions

This project makes use of Docker. Hadoop is a framework for distributed computing. As such, it's necessary to simulate
a distributed computing environment in order to effectively learn and explore Hadoop in its natural form. So, Docker to
the rescue. We can use Docker containers to virtualize computers and create a distributed environment all on our own
personal computer. There is an open source project for running Hadoop in Docker: [`docker-hadoop`](https://github.com/big-data-europe/docker-hadoop).
This project uses `docker-hadoop` via a Git sub-module.

1. Initialize the `docker-hadoop` Git sub-module
   * `git submodule update --init`
1. Destroy old volumes
   * I've found that subsequent attempts to start the Hadoop-in-Docker cluster will not work after the first. A few containers
     will never come up as "healthy" and I don't know why. It's hard to read the logs and there are no obvious errors when
     you tail the logs. I suspect it is a data corruption problem because when I blow away the data from the previous containers,
     the new containers will come up healthy. Specifically, the way to delete the old data is to delete the old Docker volumes.
     I wish I understood Hadoop better, so I could solve this without deleting data. But this works.
   * `docker compose --project-directory docker-hadoop down  --volumes`
1. Start the "namenode" Hadoop Docker container
   * `docker compose --project-directory docker-hadoop up --detach namenode`
   * Continually run `docker container ls` until the container "STATUS" shows "healthy"
1. Perform the inaugural HDFS format operation
   * Why? From the [*Hadoop Cluster Setup*](https://hadoop.apache.org/docs/stable/hadoop-project-dist/hadoop-common/ClusterSetup.html) docs:
     > The first time you bring up HDFS, it must be formatted.
   * Execute: `docker exec -it namenode bash -c 'hdfs namenode -format'`
   * It will prompt for a "Y/n". Answer the prompt.
   * Confirm that you see the message in the last 10 lines of output:
     > Storage directory /hadoop/dfs/name has been successfully formatted
1. Start the rest of the Docker containers:
   * `docker compose --project-directory docker-hadoop up --detach`
   * Continually run `docker container ls` until all containers show "healthy"
1. Set up some test data that will later be consumed by a MapReduce job:
   * `IN PROGRESS`
1. Build a "WordCount" MapReduce job:
   * `./gradlew word-count-map-reduce-job:jar`
   * Note: A MapReduce "job" can take on many forms. For this project, it takes the form of a Java `.jar` file. The other
     forms are out-of-scope for this playground repo. For example, a MapReduce job can be written in Python.  
1. Submit the job to the Hadoop cluster to be executed:
   * `TODO`
1. Wait for completion and verify the results:
   * `TODO`

## TODO

This is an in-progress project. These are the TODO items:

* IN PROGRESS Do the "hello world" of Hadoop examples
  * Do the "WordCount" example detailed in [the Hadoop docs](https://hadoop.apache.org/docs/current/hadoop-mapreduce-client/hadoop-mapreduce-client-core/MapReduceTutorial.html#Example:_WordCount_v1.0)
* DONE Use [docker-hadoop](https://github.com/big-data-europe/docker-hadoop) as a Git sub-module. This means we don't have to
  figure out how to put Hadoop in Docker!
  
## Notes

* Jump into a Bash shell session in one of the Hadoop Docker containers explore. Use an alias, too!
    * ```
      alias doBash="docker exec -it resourcemanager bash"
      doBash
      ```
## Wish List

General clean-ups, changes and things I wish to implement for this project:

* Sprinkle in Yarn somehow
  * Or is Yarn just implicitly there anyway if I run a Map Reduce job?
* Sprinkle in Oozie for scheduling
* Figure out secrets management.
  * I.e. figure out passwords files, file permissions and the "CredentialProvider" thing.
* Add a Spark example job
    
## Reference Materials

* [Hadoop official site: *Hadoop: Setting up a Single Node Cluster*](https://hadoop.apache.org/docs/stable/hadoop-project-dist/hadoop-common/SingleCluster.html)
* [Hadoop official site: *Download*](https://hadoop.apache.org/releases.html)
* [Hadoop official site: *Hadoop Cluster Setup*](https://hadoop.apache.org/docs/stable/hadoop-project-dist/hadoop-common/ClusterSetup.html)
* [Hadoop official site: *Apache Hadoop Downstream Developer’s Guide*](https://hadoop.apache.org/docs/current/hadoop-project-dist/hadoop-common/DownstreamDev.html)
  * A starting point for developing a program that runs in Hadoop
* [Hadoop-in-Docker project `big-data-europe/docker-hadoop`](https://github.com/big-data-europe/docker-hadoop)
