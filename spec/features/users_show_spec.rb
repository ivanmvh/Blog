require 'rails_helper'

RSpec.describe 'user_show', type: :system do
  before :each do
    @user = User.create(name: 'John U Show',
                        photo: '3-photo.jpg', bio: 'Complete bio John U Show', posts_counter: 0)
    @post1 = Post.create(title: 'post 1', text: 'new post 1', comments_counter: 0, likes_counter: 0, author: @user)
    Post.create(title: 'post 2', text: 'new post 2', comments_counter: 0, likes_counter: 0, author: @user)
    Post.create(title: 'post 3', text: 'new post 3', comments_counter: 0, likes_counter: 0, author: @user)
    Post.create(title: 'post 4', text: 'new post 4', comments_counter: 0, likes_counter: 0, author: @user)
    Post.create(title: 'post 5', text: 'new post 5', comments_counter: 0, likes_counter: 0, author: @user)
    Comment.create(author: @user, post: @post1, text: 'my comments')
    # visit user_path(@user)
    # @post1_url = "#{users_path}/#{@user.id}/posts/#{@post1.id}"
    # @all_post_url = "#{users_path}/#{@user.id}/posts/"
  end

  it '1-I can see the users profile picture' do
    visit user_path(@user)
    @post1_url = "#{users_path}/#{@user.id}/posts/#{@post1.id}"
    @all_post_url = "#{users_path}/#{@user.id}/posts/"
    expect(page).to have_selector('img')
  end

  it '2-I can see the users username.' do
    visit user_path(@user)
    @post1_url = "#{users_path}/#{@user.id}/posts/#{@post1.id}"
    @all_post_url = "#{users_path}/#{@user.id}/posts/"
    expect(page).to have_content('John U Show')
  end

  it '3-I can see the users first 3 posts.' do
    visit user_path(@user)
    @post1_url = "#{users_path}/#{@user.id}/posts/#{@post1.id}"
    @all_post_url = "#{users_path}/#{@user.id}/posts/"
    expect(page).to have_content('new post 5')
    expect(page).to have_content('new post 4')
    expect(page).to have_content('new post 3')
  end

  it '4-shouldnt the first 2 post' do
    visit user_path(@user)
    @post1_url = "#{users_path}/#{@user.id}/posts/#{@post1.id}"
    @all_post_url = "#{users_path}/#{@user.id}/posts/"
    expect(page).not_to have_content('new post 1')
    expect(page).not_to have_content('new post 2')
  end

  it '5-I can see the number of posts the user has written.' do
    visit user_path(@user)
    @post1_url = "#{users_path}/#{@user.id}/posts/#{@post1.id}"
    @all_post_url = "#{users_path}/#{@user.id}/posts/"
    expect(page).to have_content('Number of posts: 5')
  end

  it '6-I can see the users bio.' do
    visit user_path(@user)
    @post1_url = "#{users_path}/#{@user.id}/posts/#{@post1.id}"
    @all_post_url = "#{users_path}/#{@user.id}/posts/"
    expect(page).to have_content('Complete bio John U Show')
  end

  it '7-I can see a button that lets me view all of a users posts.' do
    visit user_path(@user)
    @post1_url = "#{users_path}/#{@user.id}/posts/#{@post1.id}"
    @all_post_url = "#{users_path}/#{@user.id}/posts/"
    expect(page).to have_content('See all posts')
  end

  it '8-When I click a users post, it redirects me to that posts show page.' do
    visit user_path(@user)
    click_link 'Post # 1'
    expect(current_path) == @post1_url
  end

  it "9-When I click to see all posts, it redirects me to the user's post's index page." do
    visit user_path(@user)
    @post1_url = "#{users_path}/#{@user.id}/posts/#{@post1.id}"
    @all_post_url = "#{users_path}/#{@user.id}/posts/"
    click_link 'See all posts'
    expect(current_path) == @all_post_url
  end

  it '10-When I click on Add post, I am redirected to posts new page' do
    visit user_path(@user)
    @post1_url = "#{users_path}/#{@user.id}/posts/#{@post1.id}"
    @all_post_url = "#{users_path}/#{@user.id}/posts/"
    click_link 'Add a post'
    expect(page) == "#{users_path}/#{@user.id}/posts/new"
  end

  it '11-When I click on Add comment, I am redirected to posts new page' do
    @user1 = User.create(name: 'John U Show Unico',
                         photo: '3-photo.jpg', bio: 'Complete bio John U Show', posts_counter: 0)
    @post1 = Post.create(title: 'post 1', text: 'new post 1', comments_counter: 0, likes_counter: 0, author: @user1)

    visit user_path(@user1)
    # first_link = page.all(:link, 'Add comment')[0] # Obtener el segundo link
    # click_link(href: first_link['href'])
    click_link('Add comment')
    expect(page) == "#{users_path}/#{@user1.id}/comments/new"
  end
end
