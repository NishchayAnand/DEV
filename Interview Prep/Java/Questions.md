# Interview Questions

### Q. Write a solution to sort strings based on their length. If the length of two strings are equal, compare the two strings aphabetically.

We can create a custom comparator (by implementing `Comparator` interface) to define custom sorting logic for strings objects.

```
import java.util.Comparator;

public class CustomComparator implements Comparator<String> {
    @Override
    public int compare(String s1, String s2) {
        int lengthDifference = Integer.compare(s1.length(), s2.length());
        if (lengthDifference == 0) {
            return s1.compareTo(s2);
        }
        return lengthDifference;
    }
}
```

### HashMap is not thread-safe. Comment.

---

### Strings are immutable. Comment.

It means that once a String object is created, its value cannot be changed. When you perform operations on strings, such as concatenation, substring, or replace, the original string remains unchanged, and a new string is returned with the desired modifications.

> NOTE: Strings in Java are stored as an array of characters internally (char[]), which is declared as final.

Since strings are immutable, they are inherently thread-safe. Multiple threads can share the same string object without worrying about synchronization issues.

---

### What is a String Pool?

A special memory area within the heap where string literals are stored. It is used to optimize memory usage and improve performance when dealing with string literals by avoiding the creation of multiple identical `String` objects.

---

### Q. Why is Java a platform independent language?

Java is a compile-type language. The compiled code, i.e, bytecode can run on various operating systems and hardware infrastructures without requiring modifications.

---

### Q. What is Stack Memory?

Stack memory is a specific area of memory in a computer's RAM (Random Access Memory) that stores temporary variables created by each function.

---

### Q. What is classpath?

The `classpath` is an **environment variable** that tells the Java compiler and JVM where to look for compiled class files (.class) when running your program.

---

### Q. What were the differences between `Abstract Classes` and `Interfaces` before Java 8?

Before Java 8, the differences between abstract classes and interfaces in Java were more pronounced. Here are the key distinctions:

**Abstract Classes:**

1. **Abstract classes can have both abstract methods (methods without an implementation) and concrete methods (methods with an implementation).** Concrete methods in abstract classes can provide a default behavior that subclasses can use or override.

2. **Abstract classes can have instance variables (fields) with various access modifiers** (private, protected, public).

3. A **class can inherit from only one abstract class** due to Java’s single inheritance constraint.

4. **Methods** in abstract classes **can have any access modifier**: private, protected, public, or package-private (default).

5. Though Abstract classes cannote be instantiated, they can have constructors, which can be used to initialize fields in the abstract class. Subclasses can call the constructor of the abstract class using super().

**Interfaces:**

1. Interfaces could only have abstract methods (methods without an implementation).

2. Interfaces cannot have any instance variables (fields). We can **only define constants** which were implicitly `public`, `static`, and `final`.

3. A class can implement multiple interfaces, **providing** a form of **multiple inheritance**.

4. All methods in interfaces were implicitly `public` and `abstract`.

5. Interfaces cannot have constructors because they cannot have any instance fields.

---

### Q3. What are the differences between `Abstract Classes` and `Interfaces` after Java 8?

After Java 8, the distinctions between abstract classes and interfaces have narrowed due to the introduction of `default` and `static` methods in interfaces. Here are the key distinctions:

1. **Abstract Classes can have instance variables that maintain instance-specific `state`, whereas Interfaces cannot.**

2. A class can only implement one Abstract Class whereas it can implement multiple Interfaces. **If a class implements multiple interfaces that have `default` methods with the same signature, the class must override the method to resolve the conflict.**

---

### Q. State the differences between equals() method and equals operator.

An object may contain multiple types of data. Using the equals (`==`) operator does not work for comparison of objects. Hence, we need to use equals() method. The equals() method compares the value.

---
