# Understanding Multithreading in Java

## Main Thread

Every Java application starts up a main thread - the thread that puts the main() method on the bottom of the stack. The JVM is responsible for starting the main thread (and other threads, as it chooses, including the garbage collection thread).

As a programmer, you can write code to start other threads of your own.

> **NOTE:** Unless you have multiple processors on your computer, each new Java thread is not actually a separate process runnning on the OS. But it almost feels as though it is.

## How Multithreading works?

With more than one thread, you get the appearance of having multiple things happen at the same time.

In reality, the execution between threads move back and forth so rapidly that you feel as though all threads are executing at the same time.

Remember, Java is just a process running on your underlying OS. So first, Java itself has to be the **currently executing process** on the OS. But once Java gets its turn to execute, JVM runs whatever is on the top of the currently-running stack.

> **NOTE:** One of thinngs a thread must do is keep track of which statement (of which method) is currently executing on the thread's stack.

## How to launch a new Thread?

You can launch a separate thread of execution (with its own call stack) by creating a new `Thread` object.

Sample Code:

```
Thread  t = new Thread();
t.start();
```

The thread `t` defined above would actually do nothing. It "dies" virtually the instant it's born. We need the code that you want to have run by a separate thread passed in as the constructor argument to `Thread()`.

A Thread object needs a job. A job that the thread will run when the thread is started. A thread's jobs can be defined in any class that implements the `Runnable` interface.

When you pass a `Runnable` to a `Thread` constructor, you're really just giving the `Thread` a way to get to a `run()` method (define the code that we want the thread to execute).

Sample Code:

```
Runnable r = new MyThreadJob();
Thread t = new Thread(r);
t.start();
```

Here, `MyThreadJob` is the class that implements the Runnable interface (defines its `run()` method which ). `t.start()` actually starts a new thread, putting the `Runnable` object's `run()` method on the bottom of the new thread's stack.

> **NOTE:** Runnable is the job a thread is supposed to run.

## 3 States of a new Thread

1. `Thread t = new Thread(r);`: A `Thread` instance has been created but not started. In other words, there's a `Thread` object, but no thread of execution.

2. `t.start();`: When you start the thread, it moves to the **Runnable state**. This means the thread is ready to run and just waiting for its chance to be selected for execution. At this point, there is a new call stack for this thread.

3. In the **Running state** state, a thread (and ONLY this thread) has an active call stack, and the method on the top of the stack is executing.

## Thread Scheduler

The **JVM thread scheduler** is responsible for selecting the thread to execute next. You can sometimes influence that decision, but you cannot forve a thread to move from **Runnable** to **Running** state. There is not API for calling methods on the scheduler.

Once the thread becomes runnable, it can move back and forth between runnable, running and an additional state: `temporarily not-runnable (a.k.a blocked)`.

The thread scheduler can move a running thread into a blocked state. For example,

1. A thread might be executing code to read from a `Socket` input stream, but there isn't any data to read. The scheduler will move the thread out of the running state until something becomes available.
2. The executing code might have told the thread ot put itself to sleep (`sleep()`).
3. The thread might be waiting on an object which is **locked**. In that case, the thread can't continue until the object's lock is freed by the thread that has it.

> **NOTE:** The scheduler implementations are different for different JVM's, and even running the same program on the same machine can give you different results.

Putting a thread to sleep, even for a few milliseconds, forces the currently-running thread to leave the running state, thus giving another thread a chance to run.