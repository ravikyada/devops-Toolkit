# MongoDB Backup and Restore for Multiple Databases

## Backup Databases

To back up your MongoDB databases, use the `mongodump` command with the following syntax. Replace `<uname>`, `<password>`, `<clustername>`, and `<database-name>` with your actual MongoDB credentials and database names.

### Step-by-Step Instructions:

1. **Dump Database**

    ```sh
    mongodump --uri="mongodb+srv://<uname>:<password>@<clustername>-fp0zz.mongodb.net/<database-name>?retryWrites=true" --archive | gzip > db_name.gz
    ```

2. **Repeat for All Databases**

    Perform the above command for each of your databases, changing the `<database-name>` and output file name (`db_name.gz`) accordingly. For example:

    ```sh
    mongodump --uri="mongodb+srv://<uname>:<password>@<clustername>-fp0zz.mongodb.net/db1?retryWrites=true" --archive | gzip > db1.gz
    mongodump --uri="mongodb+srv://<uname>:<password>@<clustername>-fp0zz.mongodb.net/db2?retryWrites=true" --archive | gzip > db2.gz
    mongodump --uri="mongodb+srv://<uname>:<password>@<clustername>-fp0zz.mongodb.net/db3?retryWrites=true" --archive | gzip > db3.gz
    mongodump --uri="mongodb+srv://<uname>:<password>@<clustername>-fp0zz.mongodb.net/db4?retryWrites=true" --archive | gzip > db4.gz
    mongodump --uri="mongodb+srv://<uname>:<password>@<clustername>-fp0zz.mongodb.net/db5?retryWrites=true" --archive | gzip > db5.gz
    mongodump --uri="mongodb+srv://<uname>:<password>@<clustername>-fp0zz.mongodb.net/db6?retryWrites=true" --archive | gzip > db6.gz
    ```

## Restore Databases

To restore your MongoDB databases from the dump files, use the `mongorestore` command with the following syntax. Replace `<uname>`, `<password>`, `<clustername>`, `<newdbname>`, `<source-db>`, and `<dest-db>` with your actual MongoDB credentials and database names.

### Step-by-Step Instructions:

1. **Unzip the Dump File**

    ```sh
    gunzip db_name.gz
    ```

    This will create a file named `db_name`.

2. **Restore Database**

    ```sh
    mongorestore --uri="mongodb+srv://<uname>:<password>@<clustername>-fp0zz.mongodb.net/<newdbname>?retryWrites=true" --archive=db_name --nsInclude="<source-db>.*" --nsFrom="<source-db>.*" --nsTo="<dest-db>.*"
    ```

3. **Repeat for All Databases**

    Perform the above commands for each of your databases, changing the dump file name (`db_name`), source database (`<source-db>`), and destination database (`<dest-db>`) accordingly. For example:

    ```sh
    gunzip db1.gz
    mongorestore --uri="mongodb+srv://<uname>:<password>@<clustername>-fp0zz.mongodb.net/newdb1?retryWrites=true" --archive=db1 --nsInclude="db1.*" --nsFrom="db1.*" --nsTo="newdb1.*"

    gunzip db2.gz
    mongorestore --uri="mongodb+srv://<uname>:<password>@<clustername>-fp0zz.mongodb.net/newdb2?retryWrites=true" --archive=db2 --nsInclude="db2.*" --nsFrom="db2.*" --nsTo="newdb2.*"

    gunzip db3.gz
    mongorestore --uri="mongodb+srv://<uname>:<password>@<clustername>-fp0zz.mongodb.net/newdb3?retryWrites=true" --archive=db3 --nsInclude="db3.*" --nsFrom="db3.*" --nsTo="newdb3.*"

    gunzip db4.gz
    mongorestore --uri="mongodb+srv://<uname>:<password>@<clustername>-fp0zz.mongodb.net/newdb4?retryWrites=true" --archive=db4 --nsInclude="db4.*" --nsFrom="db4.*" --nsTo="newdb4.*"

    gunzip db5.gz
    mongorestore --uri="mongodb+srv://<uname>:<password>@<clustername>-fp0zz.mongodb.net/newdb5?retryWrites=true" --archive=db5 --nsInclude="db5.*" --nsFrom="db5.*" --nsTo="newdb5.*"

    gunzip db6.gz
    mongorestore --uri="mongodb+srv://<uname>:<password>@<clustername>-fp0zz.mongodb.net/newdb6?retryWrites=true" --archive=db6 --nsInclude="db6.*" --nsFrom="db6.*" --nsTo="newdb6.*"
    ```

Replace the placeholders with your actual MongoDB credentials and database names before running the commands.