require 'rails_helper'

RSpec.describe PostsController, type: :request do
  describe 'GET /show' do
    context 'posts of a user should render correctly' do
      it 'check for a succesful response of post of a user' do
        get '/users/10/posts'
        expect(response).to be_successful
      end
      it 'renders the index template' do
        user = User.create(name: 'user-name-1', photo: 'photo-user-1.jpg',
                           bio: 'bio-user-1.', posts_counter: 0)
        get "/users/#{user.id}/posts"
        expect(response).to render_template(:index)
      end
      it 'check the content of the user posts list' do
        get '/users/5/posts'
        expect(response.body).to include('List of posts of a user')
      end

      it 'renders the show template' do
        get '/users/5/posts/8'
        expect(response).to render_template(:show)
      end

      it 'check the content of a user post' do
        get '/users/1/posts/1'
        expect(response.body).to include('Information from a user post')
      end
    end
  end
end
