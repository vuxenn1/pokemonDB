# Run Server Instructions

To execute the script, follow these steps:

### 1. Create a MySQL Schema
Before running the script, set up your MySQL database by creating a schema. Then, execute the SQL scripts in the specified order to initialize the database.

#### SQL Script Execution Order:
1. `creating-tables.sql`  
2. `insert-types.sql`  
3. `insert-badges.sql`  
4. `insert-items.sql`  
5. `insert-pokemons.sql`  
6. `insert-trainers.sql`  
7. `insert-cities.sql`  
8. `insert-routes.sql`  
9. `insert-gyms.sql`  
10. `insert-pokecenters.sql`  
11. `creating-views.sql`  
12. `procedures.sql`  
13. `triggers.sql`  

Ensure that each script completes successfully before proceeding to the next.

### 2. Configure Database Connection
Before starting the server, make sure to update the database configuration in your application. Change the **user**, **password**, and **database name** in the **index.js** file to match your MySQL setup.

### 3. Start the Server
Once the database is configured and set up, run the following command to start the server:

```bash
node index.js
```
