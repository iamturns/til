top
===

Eg: `Cpu(s): 11.4%us, 29.6%sy, 0.0%ni, 58.3%id, .7%wa, 0.0%hi, 0.0%si, 0.0%st`

Each of these percentages are a percentage of the CPU time tied up doing a particular task. The most important ones are:

**`us`**

User CPU time

More often than not, when you have CPU-bound load, it's due to a process run by a user on the system, such as Apache, MySQL or maybe a shell script. If this percentage is high, a user process such as those is a likely cause of the load.

**`sy`**

System CPU time

The system CPU time is the percentage of the CPU tied up by kernel and other system processes. CPU-bound load should manifest either as a high percentage of user or high system CPU time.

**`id`**

CPU idle time

This is the percentage of the time that the CPU spends idle. The higher the number here the better! In fact, if you see really high CPU idle time, it's a good indication that any high load is not CPU-bound.

**`wa`**

I/O wait

The I/O wait value tells the percentage of time the CPU is spending waiting on I/O (typically disk I/O). If you have high load and this value is high, it's likely the load is not CPU-bound but is due to either RAM issues or high disk I/O.
