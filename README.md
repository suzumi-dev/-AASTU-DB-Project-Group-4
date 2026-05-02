# -AASTU-DB-Project-Group-4
                                            FOOD DELIVERY DATABASE SYSTEM
#Group Members
Arsema Yeshidnber


#Description
    -This project focuses on the design and implementation of a hybrid database system for a food delivery platform, combining both relational and non-relational database technologies. It is based on the understanding that modern applications no longer rely on a single type of data structure, but instead require systems that can handle both structured and flexible data efficiently.
    -The system is designed to support essential operations such as managing customers, restaurants, menus, orders, deliveries, and payments. Rather than relying on a single database model, the project adopts a hybrid approach that takes advantage of the strengths of each technology. Structured, transaction-heavy data is handled using a relational database, while more flexible and dynamic data is managed using a NoSQL database.
    -This approach allows the system to maintain accuracy and consistency where it matters most, while also remaining scalable and adaptable as data grows and changes. In this way, the project reflects how real-world systems are increasingly being built by combining multiple technologies to achieve better performance and flexibility.
    

#Technologies Used
A range of technologies were selected to support different aspects of the system:
   -MySQL: is used as the relational database for managing structured data such as customer information, orders, and payments. It ensures that data remains consistent and reliable, especially during transactions, through the use of well-established database principles.
   -MongoDB: is used to store flexible and semi-structured data. Its document-based design makes it well-suited for handling data that may change over time, such as menu items or other dynamic content. It also supports scalability, which is important for systems with growing data.
   -Draw.io: is used to create Entity-Relationship (ER) diagrams, which help visualize how different parts of the system are connected. It plays an important role in planning and understanding the database structure before implementation.
   -GitHub: is used to manage project files and track changes throughout development. It helps keep the work organized and allows for better version control.
Google Docs: is used for writing and organizing the project documentation, making it easier to structure and present the report clearly.


#How to Run the Project 
Running the project involves setting up both database systems and testing their functionality:
    1.	Environment Setup 
First, MySQL Server and MongoDB need to be installed, along with tools like MySQL Workbench and MongoDB Compass. These tools make it easier to interact with the databases and manage data.
    2.	Setting Up the MySQL Database
A database is created in MySQL, and the SQL script defining the tables and relationships is executed. The database is designed using proper normalization techniques to reduce redundancy and ensure consistency. Sample data is then inserted for testing purposes.
    3.	Setting Up the MongoDB Database
In MongoDB, a database and collections are created to store flexible data. Sample documents are added to demonstrate how non-structured data can be handled effectively.
    4.	Testing the System
SQL queries are used to test core operations such as adding customers, placing orders, and recording payments. At the same time, MongoDB queries are used to test how flexible data is stored and retrieved.
    5.	Validation and Evaluation
The system is checked to ensure that data is accurate, queries run efficiently, and both databases work well together. This step helps confirm that the design meets its intended goals.
    6.	Generating Reports
Finally, queries are used to generate useful reports, such as summaries of orders, customer activity, and revenue. These outputs demonstrate how the system can support decision-making.


  -This project goes beyond basic database design by showing how different database technologies can be combined to solve real-world problems. It highlights the importance of choosing the right tools for different types of data and demonstrates how a hybrid approach can improve both performance and flexibility.
   -Overall, the system provides a strong foundation for understanding how modern applications are built and how effective database design can directly impact usability, efficiency, and scalability.
