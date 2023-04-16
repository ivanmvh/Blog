# Blog app - integration specs for views and fix n+1 problems

## Description
In this project, we will create integration tests for all of the views used in our project. Be sure to cover the user stories (or user workflows) that we **want** our users to experience while taking into consideration the possible errors our users may cause.
- Write integration tests with Capybara gem.
- Secure app from n+1 problems.

### Project requirements

#### n+1
- Make sure that the N+1 problem is solved when fetching all posts and their comments for a user.
    - Do not use the bullet gem in this exercise - instead analyze the logs as showed in this [article](https://dev.to/junko911/rails-n-1-queries-and-eager-loading-10eh)
    - **In our PR description include the screenshots of our app's logs before and after the fix**
    - This is the corresponding wireframe view: ![blog all user posts](../images/blog_user_all_posts.png)

#### Integration specs
- Use Capybara to write integration tests for each view in our project.
- Think on the flow of things and group the tests of page in a way that makes sense. For example, one test would check for the things in the page and another test for clicking links on it.

- User index page:
  - I can see the username of all other users.
  - I can see the profile picture for each user.
  - I can see the number of posts each user has written.
  - When I click on a user, I am redirected to that user's show page.

- user show page:
  - I can see the user's profile picture.
  - I can see the user's username.
  - I can see the number of posts the user has written.
  - I can see the user's bio.
  - I can see the user's first 3 posts.
  - I can see a button that lets me view all of a user's posts.
  - When I click a user's post, it redirects me to that post's show page.
  - When I click to see all posts, it redirects me to the user's post's index page.

- User post index page:
  - I can see the user's profile picture.
  - I can see the user's username.
  - I can see the number of posts the user has written.
  - I can see a post's title.
  - I can see some of the post's body.
  - I can see the first comments on a post.
  - I can see how many comments a post has.
  - I can see how many likes a post has.
  - I can see a section for pagination if there are more posts than fit on the view.
  - When I click on a post, it redirects me to that post's show page.

- Post show page:
  - I can see the post's title.
  - I can see who wrote the post.
  - I can see how many comments it has.
  - I can see how many likes it has.
  - I can see the post body.
  - I can see the username of each commentor.
  - I can see the comment each commentor left.

**Be sure to include integration specs for any other features we may have implemented!**

### General requirements (Don't forget this!)

- Make sure that there are no linter errors.
- Make sure that we used correct flow Gitflow.
- Make sure that we documented our work in a professional way.
- Follow our list of best practices for Ruby.

@ivanmvh
