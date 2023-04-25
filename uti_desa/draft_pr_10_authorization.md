# Blog app: add authorization rules

## Description
In this project, we will add authorization to our app using [CanCanCan](https://github.com/CanCanCommunity/cancancan).
- Limit access to web app resources based on authorization rules.

### Project requirements
- Install CanCanCan in our project.
- Add a `role` column to the users table. Remember to use a migration for this.
- A user can delete a post if it is theirs or if they have an admin role (column `role` has value `"admin"`). Use CanCanCan for this authorization.
    - For that we need to implement the post deleting functionality. Add the "Delete" button to the view and make sure that only authorized users can see it.
- A user can delete a comment if it is theirs or if they have an admin role (column `role` has value `"admin"`). Use CanCanCan for this authorization.
    - For that we need to implement the comment deleting functionality. Add the "Delete" button to the view and make sure that only authorized users can see it.

### General requirements (Don't forget)
- Make sure that there are no linter errors.
- Make sure that we used correct flow Gitflow.
- Make sure that we documented our work in a professional way.
- Follow our list of best practices for Ruby.

@ivanmvh