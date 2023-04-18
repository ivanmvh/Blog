require 'rails_helper'

RSpec.describe 'users_index', type: :system do
  before :each do
    @user1 = User.create(name: 'John U Index',
                         photo: '1-photo.jpg', bio: 'Complete bio John U Index', posts_counter: 0)
    @user2 = User.create(name: 'Pet U Index',
                         photo: '2-photo.jpg', bio: 'Complete bio Pet U Index', posts_counter: 1)
    @user3 = User.create(name: 'Jesus U Index',
                         photo: '3-photo.jpg', bio: 'Complete bio Jesus U Index',
                         posts_counter: 2)
  end

  it '1-I can see the username of all other users' do
    visit users_path
    expect(page).to have_content('John U Index')
    expect(page).to have_content('Pet U Index')
    expect(page).to have_content('Jesus U Index')
  end

  it '2-I can see the profile picture for each user.' do
    visit users_path
    expect(page).to have_selector('img')
  end

  it '3-I can see the number of posts each user has written.' do
    visit users_path
    expect(page).to have_content('Number of posts: 0')
    expect(page).to have_content('Number of posts: 1')
    expect(page).to have_content('Number of posts: 2')
  end

  it "4-When I click on a user, I am redirected to that user's show page." do
    visit users_path
    click_link 'John U Index'
    expect(page).to have_content('Complete bio John U Index')
  end

  it '5-When I click on a user, I am redirected to that user\'s show page' do
    visit users_path
    click_link @user2.name
    expect(page).to have_current_path(user_path(@user2))
  end

  it '6-When I click on [Add a post], I am redirected to posts new page' do
    @user1 = User.create(name: 'John U Index',
                         photo: '1-photo.jpg', bio: 'Complete bio John U Index', posts_counter: 0)
    @user2 = User.create(name: 'Pet U Index',
                         photo: '2-photo.jpg', bio: 'Complete bio Pet U Index', posts_counter: 1)
    @user3 = User.create(name: 'Jesus U Index',
                         photo: '3-photo.jpg', bio: 'Complete bio Jesus U Index',
                         posts_counter: 2)

    visit users_path

    all(:link, 'Add a post', exact_text: true)[1].click

    #first_link = all(:link, 'Add a post')[0] 
    #first_link.click

    expect(page) == "#{users_path}/#{@user1.id}/posts/new"
  end
end
