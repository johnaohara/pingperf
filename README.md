# Please note.  This is a patched fork of a simple benchmark, and is not an officially supported benchmark of QuarkusIO

     (                      (
     )\ )                   )\ )            (
    (()/( (          (  (  (()/(   (   (    )\ )
     /(_)))\   (     )\))(  /(_)) ))\  )(  (()/(
    (_)) ((_)  )\ ) ((_))\ (_))  /((_)(()\  /(_))
    | _ \ (_) _(_/(  (()(_)| _ \(_))   ((_)(_) _|
    |  _/ | || ' \))/ _` | |  _// -_) | '_| |  _|
    |_|   |_||_||_| \__, | |_|  \___| |_|   |_|
                    |___/

# Performance tests of Quarkus

## Motivation

Docker based comparision of quarkus using simple ping REST request. Docker images are based
on images from [hotswap-docklands](https://github.com/HotswapProjects/hotswap-docklands). Quarkus test is available
at [Pingperf-Quarkus](https://github.com/HotswapProjects/pingperf-quarkus)

## Quick start

* run `build-X.sh` to build docker image for given microprofile, spring-boot, quarkus, micronaut
* run `run-X.sh` to run docker image for given microprofile, spring-boot, quarkus, micronaut
* run wrk test with appropriate number of clients.

## HW/OS
```
$ cat /proc/cpuinfo
processor	: 0
vendor_id	: GenuineIntel
cpu family	: 6
model		: 142
model name	: Intel(R) Core(TM) i7-7600U CPU @ 2.80GHz

$ cat /proc/version 
Linux version 4.19.10-200.fc28.x86_64 (mockbuild@bkernel04.phx2.fedoraproject.org) (gcc version 8.2.1 20181105 (Red Hat 8.2.1-5) (GCC)) #1 SMP Mon Dec 17 15:46:19 UTC 2018
```

## Wrk load tests results

Tests were splitted into 3 groups varying in the heap size and the number of users (clients):

- Xmx128m running 50 clients

### 50 threads (users) / -Xmx128m

|Microprofile|Start time(s)|Process RSS (MB)|Throughput req/s|Mean Response Time (ms)|JAVA_OPTS|
|------------|-------------|----------------|----------------|-----------------------|---------|
|Quarkus - JVM 0.11.00|0.82|157|7396.84|6.03|-Xmx128m|
|Quarkus - Native 0.11.00|0.002|35|5560.1|8.69|-Xmx128m -Xms25m -Xmn100m|

