require 'rails_helper'

describe Like, type: :model do
  user = User.create(name: 'jinx', photo: '1-photo', bio: 'player', posts_counter: 0)
  post = Post.create(author: user, title: 'Vacation', text: 'Bluest beach on hawai!', comments_counter: 0,
                     likes_counter: 0)
  subject { Like.new(author: user, post:) }

  before { subject.save }

  it '1-like correctly created' do
    expect(subject).to be_valid
  end

  it '2-should increment likes counter for post' do
    prev_counter = subject.post.likes_counter
    subject.update_likes_counter
    expect(subject.post.likes_counter) == prev_counter + 1
  end
end
