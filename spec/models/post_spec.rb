require 'rails_helper'

describe Post, type: :model do
  subject do
    Post.new(
      author: User.new(name: 'name-user-1', photo: '1-photo', bio: 'bio-1'),
      title: 'post title 1',
      text: 'posts text 1',
      comments_counter: 0,
      likes_counter: 0
    )
  end
  before { subject.save }

  it 'title should be present' do
    subject.title = nil
    expect(subject).to_not be_valid
  end

  it 'title should not exceed 250 characters' do
    long_title = 'A' * 260
    subject.title = long_title
    expect(subject).to_not be_valid
  end

  it 'comments_counter should be positive' do
    subject.comments_counter = -1
    expect(subject).to_not be_valid
  end

  it 'likes_counter should be positive' do
    subject.likes_counter = -1
    expect(subject).to_not be_valid
  end

  it 'shows at 5 most recent comments' do
    subject.comments = [
      Comment.new(post: subject, author: subject.author, text: 'text-comment-1'),
      Comment.new(post: subject, author: subject.author, text: 'text-comment-2'),
      Comment.new(post: subject, author: subject.author, text: 'text-comment-3'),
      Comment.new(post: subject, author: subject.author, text: 'text-comment-5'),
      Comment.new(post: subject, author: subject.author, text: 'text-comment-6'),
      Comment.new(post: subject, author: subject.author, text: 'text-comment-7')
    ]
    expect(subject.most_recent_comments.length).to eql(5)
  end

  it 'check the content of most recent comments' do
    subject.comments = [
      Comment.new(post: subject, author: subject.author, text: 'text-comment-1'),
      Comment.new(post: subject, author: subject.author, text: 'text-comment-2'),
      Comment.new(post: subject, author: subject.author, text: 'text-comment-3'),
      Comment.new(post: subject, author: subject.author, text: 'text-comment-5'),
      Comment.new(post: subject, author: subject.author, text: 'text-comment-6'),
      Comment.new(post: subject, author: subject.author, text: 'text-comment-7')
    ]
    expect(subject.most_recent_comments.first.text).to eql('text-comment-7')
    expect(subject.most_recent_comments.last.text).to eql('text-comment-2')
  end

  it 'should increment post counter for the author' do
    initial_counter = subject.author.posts_counter
    subject.update_post_counter
    expect(subject.author.posts_counter) == initial_counter + 1
  end
end
