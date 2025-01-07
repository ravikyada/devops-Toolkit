## MYSQL

### Login
```bash
sudo mysql
mysql -u <user_name> -p -h <host_name> 
```
**Login with port:**
```bash
mysql -u <user_name> -p -h <host_name> -P <port_number>
```

### Show Users
```sql
SELECT user, host FROM mysql.user;
```

### Create User
**With a custom password:**
```sql
CREATE USER 'someuser'@'localhost' IDENTIFIED BY 'somepassword';
```
**With a random password:**
```sql
CREATE USER 'someuser'@'%' IDENTIFIED BY RANDOM PASSWORD;
```
**If you created a password for the root user and need to log in with `sudo mysql`, use the following command:**
```sql
ALTER USER 'root'@'localhost' IDENTIFIED WITH auth_socket;
```

### Assign Permissions to the User
**Grant all privileges on all databases (root user):**
```sql
GRANT ALL PRIVILEGES ON *.* TO 'someuser'@'localhost';
FLUSH PRIVILEGES;
```
**Grant all privileges on specific databases:**
```sql
GRANT ALL PRIVILEGES ON <database_name>.* TO 'username'@'localhost';
FLUSH PRIVILEGES;
```
**Give this permission to the developer only:**
```sql
GRANT SELECT, INSERT, UPDATE, DELETE, CREATE, DROP, ALTER, INDEX, LOCK TABLES, REFERENCES, CREATE VIEW, SHOW VIEW ON *.* TO 'developer'@'localhost';
FLUSH PRIVILEGES;
```

### Show Privileges of Any User
```sql
SHOW GRANTS FOR 'developer'@'localhost';
```

### Remove Grants
```sql
REVOKE ALL PRIVILEGES, GRANT OPTION FROM 'someuser'@'localhost';
```

### Delete User
```sql
DROP USER 'someuser'@'localhost';
```

### Change Remote Access to User
[How to Allow Remote Access to MySQL](https://www.digitalocean.com/community/tutorials/how-to-allow-remote-access-to-mysql)



### Cheat Sheet References
- [MySQL Cheat Sheet by Brad Traversy](https://gist.github.com/bradtraversy/c831baaad44343cc945e76c2e30927b3)
- [MySQL Security & Random Password Generation](https://dasini.net/blog/2020/04/15/mysql-security-random-password-generation/)