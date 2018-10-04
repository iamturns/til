# AWS Lingo

https://www.expeditedssl.com/aws-in-plain-english

- ECR

  - Elastic Container Registry
  - Holds the docker containers

- ECS

  - Elastic Container Service
  - Integrates with ECR
  - Upload docker, AWS scales for you
  - Similar to Kubernetes and Docker Swarm (RIP)
  - Semi-complex tool, requires learning a whole new platform of AWS stuff
    - Mostly command line tool with GUI tacked on
  - Some say AWS was forced to provide this due to overwhelming Docker trend and demand, not because they want to
  - Rough around the edges

- EKS

  - Elastic Kubernetes Service
  - In Preview / beta mode
  - Fully compatible with ECS
  - Removes burden of managing K8 cluters, and full integration with existing AWS services

- Elastic Beanstalk

  - Like Heroku
  - Simplified abstraction layer on top of ECS
  - Automatically handles ECS and ELB (load balancer)
  - Cluster health and metrics
  - Adjustable autoscaling and instance sizing
  - Abstraacts away the underlying EC2 instances, load balancers, auto scaling groups, etc.
  - Supports standard apps (node.js, etc) or Docker containers.

- CloudFormation

  - A way to define all resources needed for deployment in config
  - Infastructure as code
  - Declare reesources (EC2, S3, even Beanstalk which manges them) or Route53
  - Drag n drop GUI of AWS services, spits out JSON file
  - Terraform is maybe a better option

- Fargate

  - Alternative to ECS and EKS
  - No need to manage, provision, or configure underlying EC2 instances or clusters
  - Lambda for Kubernetes

- AppSync

  - Upload GraphQL schema, connect to DynamoDB tables
  - Similar to Firebase with more comprehensive DB query and search features
  - When offline, data updates are automatically synced (with conflict resolution) when back online
  - SDKs for iOS, web, React Native
  - Real time data updates
  - Can be deployed via Serverless framework: https://github.com/sid88in/serverless-appsync-plugin

- Aurora

  - Serverless databases
  - Fast, relational
  - Supports most MySQL and PostgreSQL queries and tools
  - Layer on top of RDS, automates hardware provisioning, database setup, patching, backups
  - Data is continuously backed up to S3 in real time, with no performance impact to the end user. This eliminates the need for backup windows and automated backup scripts.
  - 99.99% availability. Data replicated as two copies in three zones.
  - No need to provision database storage. Automatically allocates storage in 10gb increments as needed.

- Amplify

  - JavaScript library for AWS
  - Includes: Auth, Analytics, API, GraphQL, Storage, Push Notifications, PubSub, Internationalization, Cache
