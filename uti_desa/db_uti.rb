User.new(name: 'name-1', photo: '1-photo.jpg', bio: 'Bio message 1', posts_counter: 0)

Post.new(author: subject, title: 'Post Title  1', text: 'text 1', comments_counter: 0, likes_counter: 0)
Post.new(author: subject, title: 'Post Title  2', text: 'text 2', comments_counter: 0, likes_counter: 0)
Post.new(author: subject, title: 'Post Title  3', text: 'text 3', comments_counter: 0, likes_counter: 0)

Comment.new(post: subject, author: subject.author, text: 'text-comment-1')
Comment.new(post: subject, author: subject.author, text: 'text-comment-2')

Like.new(author: user, post:)

# u1 = User.new(name: '5-name-user-5', photo: '5-photo.jpg', bio: 'Bio message 5', posts_counter: 0)

# p1 = Post.new(author: 2, title: 'Post Title  2-1', text: 'text 2-1', comments_counter: 0, likes_counter: 0)
# u2 = User.find(2)
