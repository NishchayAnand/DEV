# Understanding SpringBoot

Spring started as a lightweight alternative to Java Enterprise Edition (JEE, J2EE as it was known at the time). Rather than develop components as heavyweight Enterprise JavaBeans (EJBs), Spring offered a simpler approach to enterprise Java development, utilizing **dependency injection** and **aspect-oriented programming** to achieve the capabilities of EJB with plain old Java objects (POJOs).

While Spring was lightweight in terms of component code, it was heavyweight in terms of configuration. Initially, Spring was configured with `XML`. Spring 2.5 introduced **annotation-based component-scanning**, which eliminated a great deal of explicit XML configuration. Spring 3.0 introduced a **Java-based configuration** as a type-safe and refactorable option to XML.

Component-scanning reduced configuration and Java configuration made it less awkward, but Spring still required a lot of configuration. Enabling certain Spring features such as transaction management and Spring MVC required explicit configuration, either in XML or Java.

**All the configuration represents development friction.** Any time spent writing configuration is time spent not writing application logic. The mental shift required to think about configuring a Spring feature distracts from solving the business problem.

**Dependency management is another form of friction.** Deciding what dependencies (libraries) need to be part of the project build is tricky enough. But it's even more challenging to know which versions of whose libraries will play well with others.

Spring Boot brings a great deal of magic to Spring application development. However, **three foundational features of Spring Boot include:**

1. Auto-Configuration
2. Simplified Dependency Management
3. Simplified Deployment

## Auto-Configuration

Spring Boot can automatically configure beans based on the libraries present in your application's classpath. For example, if a `JDBC` driver is on the classpath, Spring Boot will auto-configure a `DataSource` bean.

We no longer have to manually configure beans for common functionalities such as database connections or a web server, Spring Boot can do this for us.

## Simplified Dependency Management

It can be challenging to add dependencies to a project's build. **What library do you need? What are its group and artifact? Which version do you need? Will that version play well with other dependencies in the same project?**

Each primary dependency incorporates numerous other secondary dependencies in order to fulfill its promised functionality.

Using libraries together requires a certain degree of rigor, as on eversion of particular dependency may have been tested (or even function correctly) only with a specific version of another dependency.

When it comes to chasing down and bashing bigs from mismatches that popup between dependencies, there are no prizes, only elusive conclusive diagnoses and hours wasted pursuing them.

Spring Boot offers help with project dependency management by way of starter dependences. Spring boot starters, called **Bills of Materials (BOMs)** built around the proven premise that vast majority of times you provide a particular capability, you do it in nearly the same way, nearly every time.

For example, each time we build an API, we expose endpoints, listen for requests, process requests, convert to and from objects, exchange information in 1+ standard formats, send and receive data over the wire using a particular protocol, and more.

Adding a single starter: `spring-boot-starter-web` provides all of those related functionalities in a **single application dependency.**

Spring Boot's starter dependencies free you from worrying about which versions of the libraries you need. All dependencies encompassed by a starter are version-synchronized, meaning that they've been tested successfully together and the included version of library A is proven to function properly with the included version of library B, C, D, etc.

## Simplified Deployment

Spring Boot comes with an embedded servlet container (`Tomcat`, `Jetty`, or `Undertow`) that allows us to create web applications as self-executable JAR files that can be run on the command line without deploying applications to a conventional Java application server.

> **NOTE:** Spring Boot is just Spring. Inside, Spring Boot is doing the same kind of bean configuration in Spring that you might do on your own if Spring Boot didn't exist. Thankfully, because Spring Boot does exist, you're freed from dealing with explicit boilerplate configuration and are able to focus on the logic that makes your application unique.

---

## EXTRA

### Build Plugins

Spring Boot provides build plugins for both Gradle and Maven to assist in building Spring Boot projects. For example, the Spring Boot Maven plugin provides a `spring-boot:run` goal that achieves the same thing if you're using a Maven build.

The main feature of the build plugins is that they're able to package the project as an executable JAR (often referred to as a **fat JAR** or **uber JAR**). This includes packing all of the application's dependencies within the JAR and adding a manifest to the JAR with entries that specify the main class and other necessary information, making it possible to run the application with `java -jar`.
