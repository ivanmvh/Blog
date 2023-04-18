require 'rails_helper'

RSpec.describe Comment, type: :model do
  subject do
    user1 = User.new(name: 'Mod Coll', photo: '1-photo.jpg', bio: 'Teacher from Mexico.',
                     posts_counter: 0)
    Post.create(title: 'Hello', text: 'Mi first post', likes_counter: 0, comments_counter: 0, author: user1)
  end

  context 'comments_counter should be 0' do
    it 'post title should be Hello' do
      expect(subject.comments_counter).to eq(0)
    end
  end

  context 'comment should increment comments_counter by 1 each' do
    it 'Comments_counter should be equal to 3' do
      user2 = User.create(name: 'Moly Conrad', photo: '2-photo.jpg', bio: 'Teacher from Poland.',
                          posts_counter: 0)
      user2.comments.create(post: subject)
      user2.comments.create(post: subject)
      user2.comments.create(post: subject)
      expect(subject.comments_counter).to eql 3
    end
  end
end
