# DBMS Interview Questions

Q. What is a schema?

A schema is a logical structure within a database that organizes and groups database objects (like tables, views, stored procedures, and indexes) under a common namespace.

---

Q. What is normalization?

Normalization is a systematic approach to organizing data in a database to **reduce redundancy (duplicate data)** and improve data integrity. It involves dividing a database into smaller tables and defining relationships between them to ensure that data is logically stored and can be efficiently retrieved.

> NOTE: In some cases, normalization can make queries more complex due to additional joins. For read-heavy systems or data warehouses, slight denormalization (storing redundant data) is sometimes preferred to improve performance.

---

Q. Explain different Normal Forms (NFs) of Normalization.

Normalization is performed in stages called Normal Forms (NFs). Each form builds on the previous one to further reduce redundancy and improve structure. 

1. **First Normal Form (1NF)**: Ensure that each column contains atomic (indivisible) values and each row is unique.

    ```
    Non-1NF Table:

    | Student_ID |    Name    |      Subject       |
    |------------|------------|--------------------|
    | 1          | Alice      | Maths, Physics     |
    | 2          | Bob        | English, Maths     |

    1NF Table:

    | Student_ID |    Name    |  Subject   |
    |------------|------------|------------|
    | 1          | Alice      | Maths      |
    | 1          | Alice      | Physics    |
    | 2          | Bob        | English    |
    | 2          | Bob        | Maths      |
    ```

2. **Second Normal Form (2NF)**: Ensure that every non-prime attribute (non-primary key column) is fully dependent on the primary key (no partial dependency).

    ```
    Non-2NF Table:

    | Student_ID | Subject_ID | Subject |
    |------------|------------|---------|
    | 1          | 101        | Maths   | 
    | 1          | 102        | English | 

    Problem: Subject depends only on Subject_ID, not the composite key (Student_ID, Subject_ID), causing partial dependency.

    2NF Tables:

    Subject Table:

    | Subject_ID | Subject |
    |------------|---------|
    | 101        | Maths   |
    | 102        | English |

    Student-Subject Table:

    | Student_ID | Subject_ID |
    |-----------|-------------|
    | 1         | 101         |
    | 1         | 102         |
    ```

3. **Third Normal Form (3NF)**: Ensure that no transitive dependency exists (non-prime attributes should depend only on the primary key, not other non-prime attributes).

    ```
    Non-3NF Table:

    | Subject_ID | Instructor | Instructor_Email |
    |------------|------------|------------------|
    | 101        | Dr. Smith  | smith@uni.com    |
    | 102        | Dr. Brown  | brown@uni.com    |

    Problem: Instructor_Email depends on Instructor, not directly on Subject_ID.

    3NF Tables:

    Subject-Instructor Table:

    | Subject_ID | Instructor |
    |----------- |------------|
    | 101        | Dr. Smith  | 
    | 102        | Dr. Brown  | 

    Instructor Table:

    | Instructor | Instructor_Email |
    |------------|------------------|
    | Dr. Smith  | smith@uni.com    |
    | Dr. Brown  | brown@uni.com    |
    ```

### EXTRA


Q. When to use Relational and when to use Non-relational?

A Relational database should be used where we have well-defined, predictable data, where transactions are important to us, where we find value in keeping the relationships between our tables.

A Non-Relational database should be used where we have unstructured information, where pure performance is more important than ACID transactions and where we may need to scale quickly.

> NOTE: It seems that relational and document databases are becoming more similar over time, and that is a good thing: the data models complement each other. If a database is able to handle document-like data and also perform relational queries on it, applications can use the combination of features that best fits their needs. A hybrid of the relational and document models is a good route for databases to take in the future.

---

Q. What do you mean by "No Schema"?

No Schema means that arbitrary keys and values can be added to a document, and when reading, clients have no guarantees as to what fields the documents may contain.

---

Q. What do you mean by Schemaless?

Document databases are sometimes called _schemaless_, but that's misleading, as the code that reads the data usually assumes some kind of structure. There is an implicit schema, but it is not enforced by the database.

A more accurate term is _schema-on-read_ (the structure of the data is implicit, and only interpreted when the data is read), in contrast with _schema-on-write_ (the traditional approach of relational databases, where the schema is explicit and the database ensures all written data conforms to it).

> **NOTE:** Schema-on-read is similar to dynamic (runtime) type checking in programming languages, whereas schema-on-write is similar to static (compile-time) checking.

---

Q. Use ID or Text String in Table?

Whether you store an ID or a text string is a question of duplication. When you ue an ID, the information that is meaningful to humans is stored in only one place, and everything that refers to it uses an ID (which only has meaning within the database).

When you store the text directly, you are duplicating the human-meaningful information in every record that uses it.

The advantage of using an ID is that because it has no meaning to humans, it never needs to change: _the ID can remain same, even if the information it identifies changes_. Anything that is meaningful to humans may need to change sometime in the future, and if that information is duplicated, all the redundant copies need to be updated. That incurs write overheads and risks inconsistencies (where some copies of the information are updated but others aren't). _Removing such duplication is the key idea behind **normalization** in databases_.

---

Q. What is Contention?

Contention refers to a situation in computing where multiple processes, threads, or users compete for access to a shared resource, such as a CPU, memory, database row, or network bandwidth. When contention occurs, it can lead to resource conflicts, delays, or inefficiencies, as the system tries to manage and prioritize access.

---