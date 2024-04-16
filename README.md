# README

* Ruby version: 2.7.2

* Rails version: 5.2.4

* MySQL version: 8.0.36

* How to run the test suite -
    - create an empty database in MySQL
    - update 'config/database.yml' with database details
    - go to the root directory
    - run "rails server" or "rails s" in terminal

1. Account - {id, name} - Can be multiple Accounts
2. Network - {id, name, account_id} - Belongs to an Account.
3. School - {id, name, network_id} - Belongs to Network
4. UserType - {id, name} - Same UserType can exist in multiple schools
5. Users - {id, name} - User will have UserType & Belongs to a single School.

You can do CRUD operation on any of the layers.