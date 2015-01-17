Gritter
=====================

#### This is our Week 4 Weekend [Makers Academy](https://www.makersacademy.com) project where we will be introducing the use of Relational Databases.

#### [Gritter](http://evening-coast-8827.herokuapp.com/) <---- Live Link to Project

##### The main goals of Gritter:

- Create a simple Twitter clone in Ruby
- User can sign up with email and password that is stored in the database
- User can sign in with email and password retrieved from database
- User can not sign in with the incorrect credentials
- User can sign out
- User can create a bookmark of a URL link which is saved in the database
- Whether a user is singed in or not they can see the list of URL links on the homepage

How to use
----------
Clone the repository:
```shell
$ git clone git@github.com:scully87/Gritter.git
```

Change into the directory:
```shell
$ cd Gritter
```

Open from Command Line:
```shell
$ rackup
```

####To Do List
- [x] Create Sinatra Application using Server and Config file
- [x] Create a relational database using PostgresSQL
- [x] Create User Class
- [x] Create Link Class
- [x] Create Views Files for deployment
- [x] Create Tests for all functionality
- [x] Refactor File Structure for easier viewing

##### Technologies used:

- Ruby
- Rspec
- Sinatra
- Capybara
- PostgresSQL
- Data Mapper
- DataBase Cleaner
- BCrypt
- Rack-Flash
- Heroku
