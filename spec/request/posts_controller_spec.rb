require 'rails_helper'

RSpec.describe PostsController, type: :request do
  describe 'GET /show' do
    context 'posts of a user should render correctly' do
      it '1-check for a succesful response of post of a user' do
        get '/users/1/posts'
        expect(response).to be_successful
      end
      
      it '2-no renders the post index template because not post for this user' do
        user = User.create(name: 'user-name-1', photo: '1-photo.jpg',
                           bio: 'bio-user-1.', posts_counter: 0)
        get "/users/#{user.id}/posts"
        expect(response).not_to render_template(:index)
      end
      
      it '2a-renders the post index template' do
        get '/users/1/posts'
        expect(response).to render_template(:index)
      end

      it '3-check the content of the user posts list' do
        get '/users/1/posts'
        expect(response.body).to include('Posts List')
      end

      it '4-renders the show template' do
        get '/users/1/posts/1'
        expect(response).to render_template(:show)
      end

      it '5-check the content of a user post' do
        get '/users/1/posts/1'
        expect(response.body).to include('Post Info')
      end
    end
  end
end
