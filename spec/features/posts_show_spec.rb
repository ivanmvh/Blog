require 'rails_helper'

RSpec.describe 'post_show', type: :system do
  before :each do
    @user = User.create(name: 'Hekapoo',
                        photo: 'https://unsplash.com/photos/Hekapoo', bio: 'Complete bio Hekapoo', posts_counter: 0)
    @post1 = Post.create(title: 'post 1', text: 'new post 1', comments_counter: 0, likes_counter: 4, author: @user)
    Comment.create(author: @user, post: @post1, text: 'my comments')
    # visit "#{users_path}/#{@user.id}/posts/#{@post1.id}"
    # @post1_url = "#{users_path}/#{@user.id}/posts/#{@post1.id}"
    # @all_post_url = "#{users_path}/#{@user.id}/posts/"
  end

  it '1-I can see the posts title' do
    visit "#{users_path}/#{@user.id}/posts/#{@post1.id}"
    @post1_url = "#{users_path}/#{@user.id}/posts/#{@post1.id}"
    @all_post_url = "#{users_path}/#{@user.id}/posts/"
    expect(page).to have_content('Title: post 1')
  end

  it '2-I can see who wrote the post' do
    visit "#{users_path}/#{@user.id}/posts/#{@post1.id}"
    @post1_url = "#{users_path}/#{@user.id}/posts/#{@post1.id}"
    @all_post_url = "#{users_path}/#{@user.id}/posts/"
    expect(page).to have_content('by Hekapoo')
  end

  it '3-I can see how many comments it has.' do
    visit "#{users_path}/#{@user.id}/posts/#{@post1.id}"
    @post1_url = "#{users_path}/#{@user.id}/posts/#{@post1.id}"
    @all_post_url = "#{users_path}/#{@user.id}/posts/"
    expect(page).to have_content('Comments: 1')
  end

  it '4-I can see how many likes it has' do
    visit "#{users_path}/#{@user.id}/posts/#{@post1.id}"
    @post1_url = "#{users_path}/#{@user.id}/posts/#{@post1.id}"
    @all_post_url = "#{users_path}/#{@user.id}/posts/"
    expect(page).to have_content('Likes: 4')
  end

  it '5-I can see the post body.' do
    visit "#{users_path}/#{@user.id}/posts/#{@post1.id}"
    @post1_url = "#{users_path}/#{@user.id}/posts/#{@post1.id}"
    @all_post_url = "#{users_path}/#{@user.id}/posts/"
    expect(page).to have_content('new post 1')
  end

  it '6-I can see the username of each commentor.' do
    visit "#{users_path}/#{@user.id}/posts/#{@post1.id}"
    @post1_url = "#{users_path}/#{@user.id}/posts/#{@post1.id}"
    @all_post_url = "#{users_path}/#{@user.id}/posts/"
    expect(page).to have_content('Hekapoo: ')
  end

  it '7-I can see the comment each commentor left.' do
    visit "#{users_path}/#{@user.id}/posts/#{@post1.id}"
    @post1_url = "#{users_path}/#{@user.id}/posts/#{@post1.id}"
    @all_post_url = "#{users_path}/#{@user.id}/posts/"
    expect(page).to have_content('Hekapoo: my comments')
  end
end
