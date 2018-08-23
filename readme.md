## Ruby Refactoring

### Instructions
1. All refactoring files are in movie_billing folder
1. All testing files are in movie_billing_test
    * To run test files, please comment out `private`(line 50) and uncomment attr readers (line 6) in customer.rb

### Key changes
1. used `attr reader/accessor` instead of getter/setter methods
1. removed unnecessary `return` in each methods
1. created `movie_type hash `to make codes more semantic
1. deconstructed `print_statement method ` into smaller methods to serve different purposes
1. changed `@rentals` instance variable form array to hash, so add(get)/remove(return) a movie will take O(1) time
1. changed logic for calculating `total amount and renter points`. Initially they are calculated after a customer gets a movie, now they are calculated when a customer is getting a movie to avoid repeated calculation.
1. separated each class into different files
