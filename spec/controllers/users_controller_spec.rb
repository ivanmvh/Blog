require 'rails_helper'

RSpec.describe 'Users', type: :request do
  describe 'GET /users' do
    context 'users should render correctly' do
      it '1-renders a successful response' do
        get users_path
        expect(response).to be_successful
      end

      it '2-renders the correct template' do
        get users_path
        expect(response).to render_template(:index)
      end

      it '3-renders the correct template' do
        user = User.create(name: 'Uber Carl', photo: '4-photo.jpg',
                           bio: 'Teacher from Poland.', posts_counter: 0)
        get user_path(id: user.id)
        expect(response).to render_template(:show)
      end

      it '4-renders the view with the correct placeholder text' do
        User.create(name: 'Uber Carl', photo: '4-photo.jpg',
                    bio: 'Teacher from Poland.', posts_counter: 0)
        get users_path
        expect(response.body).to include('Uber Carl')
      end

      it '5-renders the view with the correct placeholder text' do
        user = User.create(name: 'Uber Carl', photo: '4-photo.jpg',
                           bio: 'Teacher from Poland.', posts_counter: 0)
        get user_path(id: user.id)
        expect(response.body).to include('Uber Carl')
      end
    end
  end
end
