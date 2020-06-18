---
title: "Afraid you don't understand  Reslience4j state changes: Read this missing manual on Ring Bit Buffer"
date: 2020-06-16T23:19:49-04:00
author: Dinesh Arora
type: post
url: /2020/06/17/resiliene4j-circuitbreaker-ringbitbuffer/
keywords:
  - Java
  - CompleteableFuture
  - Supplier
  - Callable
  - Resiliene4j
  - Timelimiter
  - CircuitBreaker
  - Ring bit buffer

description: Understanding how Resilience4j ringbit buffer works, is the key to understanding the internal working of [Resilience4j](https://resilience4j.readme.io/) circuit breaker state change. If you don't know this then you are missing how the buffer counts and hence you will fall into the trap of missing open/close counts in the logs. 
categories:
  - Tech Notes

---
[Resilience4j](https://resilience4j.readme.io/) calculates the failure threshold using ringbit buffer. 
![png](/resources/img/r4j/ringbit.PNG)

The state of circuitbreaker changes from __CLOSED__ to __OPEN__ when at end of count size the failure rate exceeds the threshold.

Resilience4j provides you two buffers - CLOSED and HALF_OPEN state buffers. Imagine this is our set up

Closed buffer size = 10
Half open buffer size = 5
Failure rate threshold = 60%
Open state count = 10

When the first call comes in the buffer has 0 entries. At the end of 10th call the imagine that all calls were successful. Threshhold rate is calculated to 0% after 10 calls.
![png](/resources/img/r4j/p1.PNG)

Then the next 6 calls all failed calls and will push out the first 6 Passed calls. After 11th call onwards, the threshold rate will keep getting updated at each new entry.

![png](/resources/img/r4j/p2.PNG)
![png](/resources/img/r4j/p3.PNG)
![png](/resources/img/r4j/p4.PNG)

At the end of 16th call, the state would change to OPEN. In the open state this bucket would stay as is for next 10 calls.
After end of 25th call, the state would change to HALF_OPEN and half open bucket will start filling. Say all the 5 calls are success, then then the circuitbreaker is closed.

At this moment, the threshold rate is reset for CLOSED state. For threshold to be calculated again, the buffer must fill in again.
![png](/resources/img/r4j/p5.PNG)
![png](/resources/img/r4j/p6.PNG)
![png](/resources/img/r4j/p7.PNG)
![png](/resources/img/r4j/p8.PNG)

Then the updates on threshold rate is continouly updated with each call

![png](/resources/img/r4j/p3.PNG)
![png](/resources/img/r4j/p4.PNG)

Here's the link to the [code](https://github.com/dinesh19aug/javahabit-tutorials/tree/master/src/main/java/r4j/buffer) which uses the below config.

```java
.failureRateThreshold(60)
                                                                        .waitDurationInOpenState(Duration.ofSeconds(10))
                                                                        .permittedNumberOfCallsInHalfOpenState(3)
                                                                        .slidingWindowSize(10)
```

Logs: Pay special attention to Buffered calls and you see that buffer is emptied after state swutches from HALF_OPEN to CLOSED
```

counter = 1
Hi Dinesh
I am good. Nice to meet you
Successful call count: 1 | Failed call count: 0 | Failure rate %:-1.0 | State: CLOSED | Buffered cals:1
counter = 2
Hi Dinesh
I am good. Nice to meet you
Successful call count: 2 | Failed call count: 0 | Failure rate %:-1.0 | State: CLOSED | Buffered cals:2
counter = 3
Hi Dinesh
I am good. Nice to meet you
Successful call count: 3 | Failed call count: 0 | Failure rate %:-1.0 | State: CLOSED | Buffered cals:3
counter = 4
Hi Dinesh
I am good. Nice to meet you
Successful call count: 4 | Failed call count: 0 | Failure rate %:-1.0 | State: CLOSED | Buffered cals:4
counter = 5
Hi Dinesh
I am good. Nice to meet you
Successful call count: 5 | Failed call count: 0 | Failure rate %:-1.0 | State: CLOSED | Buffered cals:5
counter = 6
Hi Dinesh
I am good. Nice to meet you
Successful call count: 6 | Failed call count: 0 | Failure rate %:-1.0 | State: CLOSED | Buffered cals:6
counter = 7
Hi Dinesh
I am good. Nice to meet you
Successful call count: 7 | Failed call count: 0 | Failure rate %:-1.0 | State: CLOSED | Buffered cals:7
counter = 8
Hi Dinesh
I am good. Nice to meet you
Successful call count: 8 | Failed call count: 0 | Failure rate %:-1.0 | State: CLOSED | Buffered cals:8
counter = 9
Hi Dinesh
I am good. Nice to meet you
Successful call count: 9 | Failed call count: 0 | Failure rate %:-1.0 | State: CLOSED | Buffered cals:9
counter = 10
Hi Dinesh
I am good. Nice to meet you
Successful call count: 10 | Failed call count: 0 | Failure rate %:0.0 | State: CLOSED | Buffered cals:10
counter = 11
Successful call count: 9 | Failed call count: 1 | Failure rate %:10.0 | State: CLOSED | Buffered cals:10
FAILED
counter = 12
Successful call count: 8 | Failed call count: 2 | Failure rate %:20.0 | State: CLOSED | Buffered cals:10
FAILED
counter = 13
Successful call count: 7 | Failed call count: 3 | Failure rate %:30.0 | State: CLOSED | Buffered cals:10
FAILED
counter = 14
Successful call count: 6 | Failed call count: 4 | Failure rate %:40.0 | State: CLOSED | Buffered cals:10
FAILED
counter = 15
Successful call count: 5 | Failed call count: 5 | Failure rate %:50.0 | State: CLOSED | Buffered cals:10
FAILED
counter = 16
Successful call count: 4 | Failed call count: 6 | Failure rate %:60.0 | State: OPEN | Buffered cals:10
FAILED
counter = 17
Successful call count: 4 | Failed call count: 6 | Failure rate %:60.0 | State: OPEN | Buffered cals:10
FAILED
counter = 18
Successful call count: 4 | Failed call count: 6 | Failure rate %:60.0 | State: OPEN | Buffered cals:10
FAILED
counter = 19
Successful call count: 4 | Failed call count: 6 | Failure rate %:60.0 | State: OPEN | Buffered cals:10
FAILED
counter = 20
Successful call count: 4 | Failed call count: 6 | Failure rate %:60.0 | State: OPEN | Buffered cals:10
FAILED
counter = 21
Successful call count: 4 | Failed call count: 6 | Failure rate %:60.0 | State: OPEN | Buffered cals:10
FAILED
counter = 22
Successful call count: 4 | Failed call count: 6 | Failure rate %:60.0 | State: OPEN | Buffered cals:10
FAILED
counter = 23
Successful call count: 4 | Failed call count: 6 | Failure rate %:60.0 | State: OPEN | Buffered cals:10
FAILED
counter = 24
Successful call count: 4 | Failed call count: 6 | Failure rate %:60.0 | State: OPEN | Buffered cals:10
FAILED
counter = 25
Successful call count: 4 | Failed call count: 6 | Failure rate %:60.0 | State: OPEN | Buffered cals:10
FAILED
counter = 26
Successful call count: 0 | Failed call count: 1 | Failure rate %:-1.0 | State: HALF_OPEN | Buffered cals:1
FAILED
counter = 27
Hi Dinesh
I am good. Nice to meet you
Successful call count: 1 | Failed call count: 1 | Failure rate %:-1.0 | State: HALF_OPEN | Buffered cals:2
counter = 28
Hi Dinesh
I am good. Nice to meet you
Successful call count: 0 | Failed call count: 0 | Failure rate %:-1.0 | State: CLOSED | Buffered cals:0
counter = 29
Hi Dinesh
I am good. Nice to meet you
Successful call count: 1 | Failed call count: 0 | Failure rate %:-1.0 | State: CLOSED | Buffered cals:1
counter = 30
Hi Dinesh
I am good. Nice to meet you
Successful call count: 2 | Failed call count: 0 | Failure rate %:-1.0 | State: CLOSED | Buffered cals:2
counter = 31
Hi Dinesh
I am good. Nice to meet you
Successful call count: 3 | Failed call count: 0 | Failure rate %:-1.0 | State: CLOSED | Buffered cals:3
counter = 32
Hi Dinesh
I am good. Nice to meet you
Successful call count: 4 | Failed call count: 0 | Failure rate %:-1.0 | State: CLOSED | Buffered cals:4
counter = 33
Hi Dinesh
I am good. Nice to meet you
Successful call count: 5 | Failed call count: 0 | Failure rate %:-1.0 | State: CLOSED | Buffered cals:5
counter = 34
Hi Dinesh
I am good. Nice to meet you
Successful call count: 6 | Failed call count: 0 | Failure rate %:-1.0 | State: CLOSED | Buffered cals:6
counter = 35
Hi Dinesh
I am good. Nice to meet you
Successful call count: 7 | Failed call count: 0 | Failure rate %:-1.0 | State: CLOSED | Buffered cals:7
counter = 36
Hi Dinesh
I am good. Nice to meet you
Successful call count: 8 | Failed call count: 0 | Failure rate %:-1.0 | State: CLOSED | Buffered cals:8
counter = 37
Successful call count: 8 | Failed call count: 1 | Failure rate %:-1.0 | State: CLOSED | Buffered cals:9
FAILED
counter = 38
Successful call count: 8 | Failed call count: 2 | Failure rate %:20.0 | State: CLOSED | Buffered cals:10
FAILED
counter = 39
Successful call count: 7 | Failed call count: 3 | Failure rate %:30.0 | State: CLOSED | Buffered cals:10
FAILED
counter = 40
Successful call count: 6 | Failed call count: 4 | Failure rate %:40.0 | State: CLOSED | Buffered cals:10
FAILED
counter = 41
Successful call count: 5 | Failed call count: 5 | Failure rate %:50.0 | State: CLOSED | Buffered cals:10
FAILED
counter = 42
Successful call count: 4 | Failed call count: 6 | Failure rate %:60.0 | State: OPEN | Buffered cals:10
FAILED
counter = 43
Successful call count: 4 | Failed call count: 6 | Failure rate %:60.0 | State: OPEN | Buffered cals:10
FAILED
counter = 44
Successful call count: 4 | Failed call count: 6 | Failure rate %:60.0 | State: OPEN | Buffered cals:10
FAILED
counter = 45
Successful call count: 4 | Failed call count: 6 | Failure rate %:60.0 | State: OPEN | Buffered cals:10
FAILED
counter = 46
Successful call count: 4 | Failed call count: 6 | Failure rate %:60.0 | State: OPEN | Buffered cals:10
FAILED
counter = 47
Successful call count: 4 | Failed call count: 6 | Failure rate %:60.0 | State: OPEN | Buffered cals:10
FAILED
counter = 48
Successful call count: 4 | Failed call count: 6 | Failure rate %:60.0 | State: OPEN | Buffered cals:10
FAILED
counter = 49
Successful call count: 4 | Failed call count: 6 | Failure rate %:60.0 | State: OPEN | Buffered cals:10
FAILED
counter = 50
Successful call count: 4 | Failed call count: 6 | Failure rate %:60.0 | State: OPEN | Buffered cals:10
FAILED
counter = 51
Successful call count: 4 | Failed call count: 6 | Failure rate %:60.0 | State: OPEN | Buffered cals:10
FAILED
counter = 52
Successful call count: 0 | Failed call count: 1 | Failure rate %:-1.0 | State: HALF_OPEN | Buffered cals:1
FAILED
counter = 53
Hi Dinesh
I am good. Nice to meet you
Successful call count: 1 | Failed call count: 1 | Failure rate %:-1.0 | State: HALF_OPEN | Buffered cals:2
counter = 54
Hi Dinesh
I am good. Nice to meet you
Successful call count: 0 | Failed call count: 0 | Failure rate %:-1.0 | State: CLOSED | Buffered cals:0
counter = 55
Hi Dinesh
I am good. Nice to meet you
Successful call count: 1 | Failed call count: 0 | Failure rate %:-1.0 | State: CLOSED | Buffered cals:1
counter = 56
Hi Dinesh
I am good. Nice to meet you
Successful call count: 2 | Failed call count: 0 | Failure rate %:-1.0 | State: CLOSED | Buffered cals:2
counter = 57
Hi Dinesh
I am good. Nice to meet you
Successful call count: 3 | Failed call count: 0 | Failure rate %:-1.0 | State: CLOSED | Buffered cals:3
counter = 58
Hi Dinesh
I am good. Nice to meet you
Successful call count: 4 | Failed call count: 0 | Failure rate %:-1.0 | State: CLOSED | Buffered cals:4
counter = 59
Hi Dinesh
I am good. Nice to meet you
Successful call count: 5 | Failed call count: 0 | Failure rate %:-1.0 | State: CLOSED | Buffered cals:5
counter = 60
Hi Dinesh
I am good. Nice to meet you
Successful call count: 6 | Failed call count: 0 | Failure rate %:-1.0 | State: CLOSED | Buffered cals:6
counter = 61
Hi Dinesh
I am good. Nice to meet you
Successful call count: 7 | Failed call count: 0 | Failure rate %:-1.0 | State: CLOSED | Buffered cals:7
counter = 62
Hi Dinesh
I am good. Nice to meet you
Successful call count: 8 | Failed call count: 0 | Failure rate %:-1.0 | State: CLOSED | Buffered cals:8
counter = 63
Successful call count: 8 | Failed call count: 1 | Failure rate %:-1.0 | State: CLOSED | Buffered cals:9
FAILED
counter = 64
Successful call count: 8 | Failed call count: 2 | Failure rate %:20.0 | State: CLOSED | Buffered cals:10
FAILED
counter = 65
Successful call count: 7 | Failed call count: 3 | Failure rate %:30.0 | State: CLOSED | Buffered cals:10
FAILED
counter = 66
Successful call count: 6 | Failed call count: 4 | Failure rate %:40.0 | State: CLOSED | Buffered cals:10
FAILED
counter = 67
Successful call count: 5 | Failed call count: 5 | Failure rate %:50.0 | State: CLOSED | Buffered cals:10
FAILED
counter = 68
Successful call count: 4 | Failed call count: 6 | Failure rate %:60.0 | State: OPEN | Buffered cals:10
FAILED
counter = 69
Successful call count: 4 | Failed call count: 6 | Failure rate %:60.0 | State: OPEN | Buffered cals:10
FAILED
counter = 70
Successful call count: 4 | Failed call count: 6 | Failure rate %:60.0 | State: OPEN | Buffered cals:10
FAILED
counter = 71
Successful call count: 4 | Failed call count: 6 | Failure rate %:60.0 | State: OPEN | Buffered cals:10
FAILED
counter = 72
Successful call count: 4 | Failed call count: 6 | Failure rate %:60.0 | State: OPEN | Buffered cals:10
FAILED
counter = 73
Successful call count: 4 | Failed call count: 6 | Failure rate %:60.0 | State: OPEN | Buffered cals:10
FAILED
counter = 74
Successful call count: 4 | Failed call count: 6 | Failure rate %:60.0 | State: OPEN | Buffered cals:10
FAILED
counter = 75
Successful call count: 4 | Failed call count: 6 | Failure rate %:60.0 | State: OPEN | Buffered cals:10
FAILED
counter = 76
Successful call count: 4 | Failed call count: 6 | Failure rate %:60.0 | State: OPEN | Buffered cals:10
FAILED
counter = 77
Successful call count: 4 | Failed call count: 6 | Failure rate %:60.0 | State: OPEN | Buffered cals:10
FAILED
counter = 78
Successful call count: 0 | Failed call count: 1 | Failure rate %:-1.0 | State: HALF_OPEN | Buffered cals:1
FAILED
counter = 79
Hi Dinesh
I am good. Nice to meet you
Successful call count: 1 | Failed call count: 1 | Failure rate %:-1.0 | State: HALF_OPEN | Buffered cals:2
counter = 80
Hi Dinesh
I am good. Nice to meet you
Successful call count: 0 | Failed call count: 0 | Failure rate %:-1.0 | State: CLOSED | Buffered cals:0
.....
counter = 117
Successful call count: 7 | Failed call count: 3 | Failure rate %:30.0 | State: CLOSED | Buffered cals:10
FAILED
counter = 118
Successful call count: 6 | Failed call count: 4 | Failure rate %:40.0 | State: CLOSED | Buffered cals:10
FAILED
counter = 119
Successful call count: 5 | Failed call count: 5 | Failure rate %:50.0 | State: CLOSED | Buffered cals:10
FAILED
counter = 120
Successful call count: 4 | Failed call count: 6 | Failure rate %:60.0 | State: OPEN | Buffered cals:10
FAILED

Process finished with exit code 0

```