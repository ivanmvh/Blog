require 'rails_helper'

RSpec.describe User, type: :model do
  subject { User.new(name: 'name-1', photo: 'photo-1', bio: 'Bio message 1', posts_counter: 0) }

  before { subject.save }

  it 'can not miss the name' do
    subject.name = nil
    expect(subject).to_not be_valid
  end

  it 'the name must be filled' do
    expect(subject).to be_valid
  end

  it 'post_counter should be positive' do
    subject.posts_counter = -1
    expect(subject).to_not be_valid
  end

  it 'post_counter can\'t be an alphabet ' do
    subject.posts_counter = 'ABC'
    expect(subject).to_not be_valid
  end

  it 'shows at most 3 most recent posts' do
    subject.posts = [
      Post.new(author: subject, title: 'Post Title  1', text: 'text 1', comments_counter: 0, likes_counter: 0),
      Post.new(author: subject, title: 'Post Title  2', text: 'text 2', comments_counter: 0, likes_counter: 0),
      Post.new(author: subject, title: 'Post Title  3', text: 'text 3', comments_counter: 0, likes_counter: 0),
      Post.new(author: subject, title: 'Post Title  4', text: 'text 4', comments_counter: 0, likes_counter: 0),
      Post.new(author: subject, title: 'Post Title  5', text: 'text 5', comments_counter: 0, likes_counter: 0),
      Post.new(author: subject, title: 'Post Title  6', text: 'text 6', comments_counter: 0, likes_counter: 0),
      Post.new(author: subject, title: 'Post Title  7', text: 'text 7', comments_counter: 0, likes_counter: 0),
      Post.new(author: subject, title: 'Post Title  8', text: 'text 8', comments_counter: 0, likes_counter: 0)
    ]
    expect(subject.most_recent_posts.length).to eql(3)
  end

  it 'check the content of most recent records' do
    subject.posts = [
      Post.new(author: subject, title: 'Post Title  1', text: 'text 1', comments_counter: 0, likes_counter: 0),
      Post.new(author: subject, title: 'Post Title  2', text: 'text 2', comments_counter: 0, likes_counter: 0),
      Post.new(author: subject, title: 'Post Title  3', text: 'text 3', comments_counter: 0, likes_counter: 0),
      Post.new(author: subject, title: 'Post Title  4', text: 'text 4', comments_counter: 0, likes_counter: 0),
      Post.new(author: subject, title: 'Post Title  5', text: 'text 5', comments_counter: 0, likes_counter: 0),
      Post.new(author: subject, title: 'Post Title  6', text: 'text 6', comments_counter: 0, likes_counter: 0),
      Post.new(author: subject, title: 'Post Title  7', text: 'text 7', comments_counter: 0, likes_counter: 0),
      Post.new(author: subject, title: 'Post Title  8', text: 'text 8', comments_counter: 0, likes_counter: 0)
    ]
    expect(subject.most_recent_posts.first.text).to eql('text 8')
    expect(subject.most_recent_posts.last.text).to eql('text 6')
  end
end
