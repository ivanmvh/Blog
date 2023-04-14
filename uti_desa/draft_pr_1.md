# Blog app - creating a data model

## Learning objectives
- Install Ruby on Rails framework.
- Use Ruby Gems as a software packages system.
- Understand what ORM is.
- Use database migration files to maintain database schema.

## Description
In this project, we will use migration files to build our schema.

### General requirements

- Make sure that there are no linter errors.
- Make sure that we used correct flow Gitflow.
- Make sure that we documented our work in a professional way.
- Follow our list of best practices for Ruby.


### Project requirements
Be sure to reference the [ERD diagram] from the sneak peek if we have any questions about table or column names or data relationships.

- Create a new app. Give it a meaningful name.
- Initialize our project with Git.
- Make sure that our project has Postgres database set up.
- Build our project schema.
    - Create and run the necessary migration files.
    - Table and column names should match the ERD diagram.
        - note: photo for users table should be a link to an image
    - Foreign keys should be included.
        - Pay attention that in `posts` table the column holding the foreign key to the `users` table should be named `author_id`
    - All columns that are foreign keys should have a corresponding index.

@ivanmvh