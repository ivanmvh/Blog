require 'rails_helper'

describe Comment, type: :model do
  user = User.create(name: 'user-name-1', photo: '1-photo', bio: 'bio-user-1', posts_counter: 0)
  post = Post.create(author: user, title: 'post-title-1', text: 'post-text-1', comments_counter: 0,
                     likes_counter: 0)
  subject { Comment.new(text: 'text comment', author: user, post:) }

  before { subject.save }

  it '1-comment correctly created' do
    expect(subject).to be_valid
  end

  it '2-should increment comments counter for post' do
    prev_counter = subject.post.comments_counter
    subject.update_comments_counter
    expect(subject.post.comments_counter) == prev_counter + 1
  end
end
