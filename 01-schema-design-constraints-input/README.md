# Phase 1: Schema Design, Constraints, Input

## Business Scenario
The `Shade School of Music` is transitioning their data from an Excel sheet to a relational database model that utilizes PostgreSQL. Five tables will need to be created to transfer the data to the new model:
* Parent Info
* Student Info
* Teacher Info
* Invoices
* Instrument List

To store all of the tables that will be used, an initial database needs to be created. 

## Step-by-Step Implementation
### Step 1: Create Database and Tables
A database for the music school was created, titled `ShadeMusicSchool`. Inside the database, five tables were created to hold all relevant business data.

![Database and Tables](./images/database-and-tables.png)

*Figure 1: The initial setup of the database and the tables needed for the music school.*

Next, **independent** tables were added. These tables were **Instrument List**, **Parent Info**, and **Teacher Info.** Constraints were added to these three tables to allow them to be related to the dependent tables that will be created next:
* **`GENERATED ALWAYS AS IDENTITY`**: Ensures that the **Instrument List** and **Teacher Info** tables have unique identifiers to appropriately relate data in the independent and dependent tables. 
* **`NOT NULL`**: Ensures that certain data, like the **Parent Info** email column, is entered and critical information is not missing.
* **`UNIQUE`**: Ensures that certain data, like the **Teacher Info** email column, is not duplicated and that there is no redundant data.
* **`PRIMARY KEY` / `FOREIGN KEY`**: Used to create the relations necessary for the dependent tables that will be created.

The next tables to be added are the **Invoice Info** and **Student Info** tables. These two tables are **dependent** and rely on the data in the **independent** tables. For example, the **Student Info** table has three `CONSTRAINTS` to appropriately relate the table to the **independent** tables:

```sql
CONSTRAINT student_info_parent_id_fkey FOREIGN KEY (parent_id) REFERENCES parent_info (id),
CONSTRAINT student_info_teacher_id_fkey FOREIGN KEY (teacher_id) REFERENCES teacher_info (id),
CONSTRAINT student_info_instrument_id_fkey FOREIGN KEY (instrument_id) REFERENCES instrument_list (id)
```

The complete database script can be found here: [01_schema.sql](./01_schema.sql)

### Step 2: Data Input
Data input begins with the **independent** tables, and a basic `INSERT INTO` command is used to populate the values. First, we input the values into the **Instrument List** table:

```sql
-- Seeding data for Instrument List
INSERT INTO instrument_list (instrument_name) VALUES 
('Piano'),
('Violin'),
('Viola'),
('Cello'),
...
```
Since there is a `GENERATED ALWAYS AS IDENTITY` constraint, the `id` column will be unique and there are no instruments with duplicate identifiers.

Next, values are inserted into the **Parent Info** table. Since `NOT NULL` constraints were used in this table, data will only be successfully added if values are able to be inserted into the table. 
```sql
INSERT INTO parent_info (id, full_name, email, phone) VALUES 
(1, 'Tim Shade', 'tshade84@gmail.com', '412-333-5252'),
(2, 'Tyler Callahan', 'tyler.callahan@comcast.net', '222-533-2124'),
(3, 'Charles Allen', 'charallen@comcast.net', '211-121-1234'),
...
```

Data is now inserted into the final independent table, **Teacher Info.** This table also uses the `GENERATED ALWAYS AS IDENTITY` constraint, and the `id` value does not need to be listed in the insert statement. Additionally, the `UNIQUE` constraint was added to the email column, and values will only be successfully added if there are no duplicate emails.
```sql
INSERT INTO teacher_info (full_name, email, phone) VALUES 
('Amber Hindy', 'ahindy@gmail.com', '212-424-3431'),
('Pablo Richardson', 'rpablo@gmail.com', '111-111-1112'),
('Makaela Guntz', 'mikkig@gmail.com', '724-555-5123'),
...
```

The **dependent** tables will now receive their input data. Starting with the **Invoice Info** table, each invoice needs to be mapped to a specific parent, which was determined by the `FOREIGN KEY` that was established during table creation. This allows multiple invoices to be mapped to a single parent. Whether or not an invoice was paid is determined by a `BOOLEAN` value, and a unique id is generated for each invoice.
```sql
INSERT INTO invoice_info (parent_id, billing_amount, invoice_paid) VALUES 
(1, 200.00, false),
(1, 150.00, false),
(1, 350.00, true),
(2, 100.00, true),
(3, 450.00, true),
...
```

Finally, we add the students to the **Student Info** table. 
```sql
INSERT INTO student_info (parent_id, teacher_id, instrument_id, full_name, age) 
VALUES 
(1, 1, 2, 'Charles Shade', 14),
(3, 2, 8, 'Timothy Allen', 6),
(4, 5, 9, 'John Mangiardi', 17),
(5, 4, 1, 'Annabel Smith', 3),
...
```
This data needs to be added correctly so data is appropriately mapped to the corresponding independent tables. However, if an improper value was inserted, we could alter values using the `UPDATE` command. If we needed to update the `teacher_id` value for the first student, **Charles Shade**, that could be done with the following command:
```sql
UPDATE student_info
SET teacher_id = 2
WHERE full_name = 'Charles Shade';
```

The complete input script can be found here: [02_inputs.sql](./02_inputs.sql)
