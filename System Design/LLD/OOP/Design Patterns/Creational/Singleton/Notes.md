# Understanding Singleton Pattern

**DEFINITION: Ensures a class has only one instance, and provides a global point of access to it.**

## Basic Implementation

```
public class Singleton {

    private static Singleton obj = null;

    private Singleton() {
        System.out.println("Creating an object of Singleton class");
    }

    public static Singleton getInstance() {
        if (obj == null) {
            obj = new Singleton();
        }
        return obj;
    }
}
```

The above implementation is not thread-safe. Multiple threads could potentially enter the getInstance() method simultaneously, and both could end up creating separate instances of the Singleton class, violating the Singleton pattern's guarantee of a single instance.

## How to make the Singleton Class Thread-Safe.

1. **Synchronized Method**: You can synchronize the getInstance() method to ensure that only one thread can access it at a time.

   ```
   public class Singleton {
        private static Singleton obj = null;

        private Singleton() {
            System.out.println("Creating an object of Singleton class");
        }

        public static synchronized Singleton getInstance() {
            if (obj == null) {
                obj = new Singleton();
            }
            return obj;
        }
   }
   ```

   The method is `synchronized`, which can lead to performance overhead since every call to getInstance() will be synchronized, even after the instance has been created.

2. **Double-Checked Locking**: To avoid the performance cost of synchronized methods, you can use double-checked locking. This ensures that synchronization happens only when the instance is null and is not required for every subsequent call to getInstance().

   ```
   public class Singleton {
        private static volatile Singleton obj = null;

        private Singleton() {
            System.out.println("Creating an object of Singleton class");
        }

        public static Singleton getInstance() {
            if (obj == null) {
                synchronized (Singleton.class) {
                    if(obj == null) {
                        obj = new Singleton();
                    }
                }
            }
            return obj;
        }
   }
   ```

   NOTE: The `volatile` keyword would ensure that the writes to obj are visible to all threads.

---

The **Singleton Pattern** is a convention for ensuring one and only one object is instantiated for a given class.

Singleton Pattern gives us a global point of access, just like global variable. However, with Singleton Pattern, we can create objects only when they are needed.

## How to implement Singleton Pattern?

**Private Constructor:** Only methods in a class can access the private constructor.

```
public class MyClass {
    private MyClass() {}
}
```

To get hold of a Singleton Object, you don't instantiate one, you ask for an instance using a `getInstance` method. This can help us make sure that if we never need the instance, it never gets created (**lazy instantiation**).

```
public static MyClass getInstance() {
        return new MyClass();
}
```

## Issues with Multithreading

Using the Singleton pattern in a multithreaded environment can be tricky and requires careful handling to avoid issues such as creating multiple instances of the singleton class.

Our multithreading woes are almost trivially fixed by making `getInstance()` a synchronized method.

```
public static synchronized Singleton getInstance() {
    if(uniqueInstance==null){
        uniqueInstance = new Singleton();
    }
    return uniqueInstance;
}
```

By adding the **synchronized keyword** to `getInstance()`, we force every thread to wait its turn before it can enter the method. That is, no two threads may enter the method at the same time. However, the only time synchronization is relevant is the first time `getInstance` method is executed. In other words, once we have set the `uniqueInstance` variable to an instance of Singleton, we have no further need to synchronize this method. After the first time through, synchronization is totally unneeded overhead!

> **NOTE:** Synchronizing a method can decrease the performance by a factor of 100, so if a high-traffic part of your code begins using `getInstance()`, you hav have to reconsider.

We have 2 options to avoid the overhead associated with synchronizing the `getInstance()` method:

1.  Do nothing if calling the getInstance method isn't causing substantial overhead for your application.

2.  Move to an eagerly created instance rather than a lazily created one.

    ```
    public class Singleton {

        private static Singleton uniqueInstance = new Singleton();

        private Singleton() {}

        public static Singleton getInstance() {
            return uniqueInstance;
        }

    }
    ```

    Using this approach, we rely on the JVM to create the unique instance of the Singleton when the class is load. **The JVM guarantees that the instance will be created before any thread accesses the static uniqueInstance variable**.

3.  Using an ENUM to create Singleton.

    ```
    public enum Singleton {
        UNIQUE_INSTANCE;
    }

    public class SingletonClient {
        public static void main(String args[]) {
            Singleton singleton = Singleton.UNIQUE_INSTANCE;
        }
    }
    ```

> **NOTE:** If you are using a large number of singletons in your application, you should take a hard look at your design. Singletons are meant to be used sparingly.

---

## EXTRA

- The intention of this pattern is to ensure a class only has one instance, providing a global point of access to it.

- In Java, the key to singleton pattern is restricting the access of who can call the constructor of a class.

- Constructors can have access modifiers. You can make the constructor private, so that no one will be able to call it except for the class that defines it. Then, the only way to get the instance of the class is have a static method to create it and return it.

```

Sample Code 1:
public class Calculator {
private static Calculator instance;

    private Constructor() {}

    public static Calculator getInstance() {
        if (instance == null) {
            instance = new Calculator();
        }
        return instance;
    }

}
Issue: Can result in multiple instances in multi-threaded environment. The multi-threading problem can be solved by making the getInstance() method synchronized, but this will have an impact in performance since we only need synchronize the access to the method once (the first time the instance is created).

Sample Code 2:
public class Calculator {
private static Calculator instance = new Calculator(); // --> instance gets created when the class is compile.

    private Calculator() {}

    public static Calculator getInstance() {
        return instance;
    }

}
Issue: The instance will always be created, we want it or not. What if the instance is expensive to create and no one uses it?

```

- A singleton provides a means to ensure that only one object instance of a class is created and referenced by clients accessing that class. Most often, singletons are defined for a particular process. However, means for defining singletons within a certain distributed processing domain can also be defined.

- Serialization, i.e., the process of storing the state of the class in the file system can also create multiple instances of the class.

- In Java, the most acceptable singleton implementation is through the use of `Enumerations` (as long as you need to extend from another class).

```

```
