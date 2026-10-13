# Oracle Database - Anime Views System

An Oracle Database project designed to manage and track anime viewing statistics, implementing security profiles, user roles, procedures, and PL/SQL functions.

## 🗂️ Project Structure & Execution Order

To set up and run the scripts correctly, execute them in the following order:

1. **`project_system.sql`**
   - Executed using the system admin account (`SYS` / `SYSTEM`).
   - Sets up tablespaces (`ANIME_HW`), security profiles, manager roles, and creates the primary users (`c##animeuser1` & `c##animeuser2`).

2. **`user1.sql`**
   - Executed by `c##animeuser1`.
   - Creates the `ANIME_VIEWS` table with constraints, inserts sample data, and grants initial object permissions.

3. **`user1_part2.sql`**
   - Executed by `c##animeuser1`.
   - Contains the PL/SQL function (`VIEWS_ADJUSTED_GET`) and stored procedure (`ADJUSTMENT_AFTER_VIEWS_UPDATE`) for view adjustments.
   - Creates bitmap/composite indexes and analyzes query performance using execution plans.

4. **`user2.sql`**
   - Executed by `c##animeuser2`.
   - Tests basic querying and data updates on `c##animeuser1.ANIME_VIEWS`.

5. **`user2_part2.sql`**
   - Executed by `c##animeuser2`.
   - Runs advanced subqueries, invokes the custom function, and executes the stored procedure.

---

## 🛠️ Tools & Technologies

- **Database:** Oracle Database
- **Language:** SQL / PL/SQL
- **Key Concepts:** Tablespaces, Security Profiles, RBAC, Functions, Stored Procedures, Indexes, Execution Plans
