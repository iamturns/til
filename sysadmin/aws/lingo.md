# AWS Lingo

https://www.expeditedssl.com/aws-in-plain-english

* ECR

  * Elastic Container Registry
  * Holds the docker containers

* ECS

  * Elastic Container Service
  * Integrates with ECR
  * Upload docker, AWS scales for you
  * Similar to Kubernetes and Docker Swarm (RIP)
  * Semi-complex tool, requires learning a whole new platform of AWS stuff
    * Mostly command line tool with GUI tacked on
  * Some say AWS was forced to provide this due to overwhelming Docker trend and demand, not because they want to
  * Rough around the edges

* EKS

  * Elastic Kubernetes Service
  * In Preview / beta mode
  * Fully compatible with ECS
  * Removes burden of managing K8 cluters, and full integration with existing AWS services

* Elastic Beanstalk

  * Like Heroku
  * Simplified abstraction layer on top of ECS
  * Automatically handles ECS and ELB (load balancer)
  * Cluster health and metrics
  * Adjustable autoscaling and instance sizing
  * Abstraacts away the underlying EC2 instances, load balancers, auto scaling groups, etc.
  * Supports standard apps (node.js, etc) or Docker containers.

* CloudFormation

  * A way to define all resources needed for deployment in config
  * Infastructure as code
  * Declare reesources (EC2, S3, even Beanstalk which manges them) or Route53
  * Drag n drop GUI of AWS services, spits out JSON file
  * Terraform is maybe a better option
