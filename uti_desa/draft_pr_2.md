# Blog App - processing data in models

## Learning objectives
- Set up associations between models.
- Write SQL queries with Active Record.

## Description
Now it's time to set up our models. To start with, we have tables for Users, Posts, Comments, and Likes, which means we need a model for each one. You've already set the foreign key in the table schema but be sure to write it here too!

### General requirements
- Make sure that there are no linter errors.
- Make sure that we used correct flow Gitflow.
- Make sure that we documented our work in a professional way.
- Follow our list of best practices for Ruby.

### Project requirements

### Create models
-  Create model classes for all entities as shown in the ERD diagram (img/blog_app_erd.png).
-  Set up associations between models.
    - Remember that `author_id` column in `posts` table should be the foreign_key for the `users` table. (Also in comments table and likes table)

### Use models to insert data
- Familiarize ourself with ['rails c' command](https://guides.rubyonrails.org/command_line.html#bin-rails-console).
- Open rails console for our project.
- Create at least one user by running the following code:
    ```ruby
       first_user = User.create(name: 'Tom', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Teacher from Mexico.')
       second_user = User.create(name: 'Lilly', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Teacher from Poland.')
    ```
- Create at least 4 posts written by one of the users we created by running the following code:
    ```ruby
       first_post = Post.create(author: first_user, title: 'Hello', text: 'This is my first post')
    ```
- Create at least 6 posts comments for one of the posts we created by running the following code:
    ```ruby
       Comment.create(post: first_post, author: second_user, text: 'Hi Tom!' )
    ```
- Use other [CRUD methods](https://github.com/microverseinc/curriculum-rails/blob/main/blog-app/lessons/active_record_crud.md) to find, update and delete entities.


### Create custom methods
Your models should include some additional methods.
-  Users
    - A method that returns the 3 most recent posts for a given user.
-  Posts
    - A method that updates the posts counter for a user.
    - A method which returns the 5 most recent comments for a given post.
-  Comments
    - A method that updates the comments counter for a post.
-  Likes
    - A method that updates the likes counter for a post.
- Go to `rails c` and check if our methods are working.


@ivanmvh
