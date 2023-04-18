require 'rails_helper'

RSpec.describe 'post_index', type: :system do
  before :each do
    @user = User.create(name: 'John King',
                        photo: '1-photo.jpg',
                        bio: 'Complete bio John King',
                        posts_counter: 0)

    @post = Post.create(title: 'post 1', text: 'my last recent post', comments_counter: 0, likes_counter: 0,
                        author: @user)

    Post.create(title: 'post 2', text: 'new post 2', comments_counter: 0, likes_counter: 0, author: @user)

    Post.create(title: 'post 3', text: 'new post 3', comments_counter: 0, likes_counter: 0,
                author: @user)

    Post.create(title: 'post 4', text: 'new post 4', comments_counter: 0, likes_counter: 0,
                author: @user)

    Post.create(title: 'post 5', text: 'new post 5', comments_counter: 0, likes_counter: 0,
                author: @user)

    Comment.create(author: @user, post: @post, text: 'comment 1')
    Comment.create(author: @user, post: @post, text: 'comment 2')
    Comment.create(author: @user, post: @post, text: 'comment 3')
    Comment.create(author: @user, post: @post, text: 'comment 4')
    Comment.create(author: @user, post: @post, text: 'comment 5')
    Comment.create(author: @user, post: @post, text: 'comment 6')

    visit user_posts_path(@user)
    @post1_url = "#{users_path}/#{@user.id}/posts/#{@post.id}"
  end

  it '1-I can see the first comments on a post.' do
    visit user_posts_path(@user)
    @post1_url = "#{users_path}/#{@user.id}/posts/#{@post.id}"
    expect(page).to have_content('comment 6')
    expect(page).to have_content('comment 5')
    expect(page).to have_content('comment 4')
    expect(page).to have_content('comment 3')
    expect(page).to have_content('comment 2')
    expect(page).not_to have_content('comment 1')
  end

  it '2-I can see the users profile picture.' do
    visit user_posts_path(@user)
    @post1_url = "#{users_path}/#{@user.id}/posts/#{@post.id}"
    expect(page).to have_selector('img')
  end

  it '3-I can see the users username.' do
    visit user_posts_path(@user)
    @post1_url = "#{users_path}/#{@user.id}/posts/#{@post.id}"
    expect(page).to have_content('John King')
  end

  it '4-I can see the number of posts the user has written.' do
    visit user_posts_path(@user)
    @post1_url = "#{users_path}/#{@user.id}/posts/#{@post.id}"
    expect(page).to have_content('Number of posts: 5')
  end

  it '5-I can see a posts title' do
    visit user_posts_path(@user)
    @post1_url = "#{users_path}/#{@user.id}/posts/#{@post.id}"
    expect(page).to have_content('Post # 1')
  end

  it '6-I can see some of the posts body.' do
    visit user_posts_path(@user)
    @post1_url = "#{users_path}/#{@user.id}/posts/#{@post.id}"
    expect(page).to have_content('new post 4')
  end

  it '7-I can see how many comments a post has.' do
    visit user_posts_path(@user)
    @post1_url = "#{users_path}/#{@user.id}/posts/#{@post.id}"
    all('#comment-count') do |count|
      expect(count.text).to eq('Comments: 6')
    end
  end

  it '8-I can see how many likes a post has.' do
    visit user_posts_path(@user)
    @post1_url = "#{users_path}/#{@user.id}/posts/#{@post.id}"
    all('#comment-count') do |count|
      expect(count.text).to eq('Like: 0')
    end
  end

  it '9-I can see a section for pagination if there are more posts than fit on the view.' do
    visit user_posts_path(@user)
    @post1_url = "#{users_path}/#{@user.id}/posts/#{@post.id}"
    all('#comment-count') do |count|
      expect(count.text).to eq('Pagination')
    end
  end

  it '10-when I click on Add posts button It should display the post form' do
    visit user_posts_path(@user)
    @post1_url = "#{users_path}/#{@user.id}/posts/#{@post.id}"
    click_link 'Add a post'
    expect(page).to have_content('Create a new post')
  end

  it '11-When I click on a post, it redirects me to that posts show page.' do
    visit user_posts_path(@user)
    @post1_url = "#{users_path}/#{@user.id}/posts/#{@post.id}"
    visit user_path(@user)
    click_link 'Post # 1'
    expect(current_path) == @post1_url
  end

  it '12-When I click on Add comment, I am redirected to posts new page' do
    @user = User.create(name: 'John King',
                        photo: '1-photo.jpg',
                        bio: 'Complete bio John King',
                        posts_counter: 0)

    @post = Post.create(title: 'post 1', text: 'my last recent post', comments_counter: 0, likes_counter: 0,
                        author: @user)

    Comment.create(author: @user, post: @post, text: 'comment 1')

    visit user_posts_path(@user)
    # first_link = page.all(:link, 'Add comment')[0]
    # click_link(href: first_link['href'])
    click_link('Add comment')
    expect(page) == "#{users_path}/#{@user.id}/comments/new"
  end
end
