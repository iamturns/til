AWS storage
===========

Elastic Block Store (EBS)
-------------------------

- Block level storage volume
- Use if require frequent and granular updates (eg: database)
- Persists indepdently from instance, once attached is used like a physical hard drive
- Three types;
    - General Purpose (SSD)
        - Recommended as default choice
    - Provisioned IOPS (SSD)
        - Consistent low-latency performance
        - Intensive I/O apps (eg: large relational or NoSQL databases
    - Magnetic
        - Lowest cost per gigabyte
        - Data accessed infrequently

Instance store
--------------

- Physically attached to host computer
- Persists only during life of EC2 instance

S3
--

- Repository of Internet data
- Provides access within EC2 or anywhere on web
