# fyber-test


<!-- TABLE OF CONTENTS -->
## Table of Contents
* [About the Project](#about-the-project)
* [Getting Started](#getting-started)
  * [Prerequisites](#prerequisites)
  * [Installation](#installation)
* [Usage](#usage)


<!-- ABOUT THE PROJECT -->
## About The Project
This project provides a consul local environment, and a flask application which sets/gets keys from the consul. The flask exposes port 5000 and register with proxy listening on port 80 (service mesh)  

<!-- GETTING STARTED -->
## Getting Started



### Prerequisites

* make
* git
* docker
* docker-compose

### Installation

1. Clone the repo
```sh
git clone https://github.com/shmfyb/fyber-test.git
```
2. Start jenkins server (Pls notice that jenkins init can take a few minutes)
```sh
make jenkins
```
3. Enter to your jenkins on your browser on [localhost:8080](http://localhost:8080)
```JS
username: fyber
password: fyber
```
4. Run The `first_job` to build customize docker image. [http://localhost:8080/job/first_job/](http://localhost:8080/job/first_job/)

5. Run The `second_job` to the consul environment with the server with the image from previous step. [http://localhost:8080/job/second_job/](http://localhost:8080/job/second_job/)
<!-- USAGE EXAMPLES -->

# Usage And Tests

* set value - run the `set_value` job [http://localhost:8080/job/set_value/](http://localhost:8080/job/set_value/). To test the job go to the consul ui and see if your key and value seted [http://localhost:8500/ui/dc1/kv/< key-name >](http://localhost:8500/ui/dc1/kv/<key-name>)
* get value - run the `get_value` job [http://localhost:8080/job/get_value/](http://localhost:8080/job/get_value/). To see value returned enter the jenkins build triggered for and see the output at the end pf the log.





