plugins {
    java
}

repositories {
    mavenCentral()
}

java {
    // Hadoop uses Java 8 so our MapReduce job will too
    sourceCompatibility = JavaVersion.VERSION_1_8
    targetCompatibility = JavaVersion.VERSION_1_8
}

val hadoopVersion = "3.2.1"

dependencies {

    // It's a bit unclear to me which Hadoop dependencies I need for my project. I can't find a description of the dependencies
    // and instead I can only find a listing of the dependencies. This listing is at https://hadoop.apache.org/docs/current/hadoop-project-dist/hadoop-common/DownstreamDev.html
    // and specifically under the section "Build Artifacts".
    // I think the "hadoop-client" dependency is the over-arching "uber" dependency but I don't see any documentation to
    // confirm that. I would love to find the official Hadoop "user guides".
    compileOnly("org.apache.hadoop:hadoop-client:$hadoopVersion")
}
