require 'rails_helper'

RSpec.describe 'Users', type: :request do
  describe 'GET /users' do
    context 'users should render correctly' do
      it '1-return a successful response' do
        get users_path
        expect(response).to be_successful
      end

      it '2-renders the :index template' do
        get users_path
        expect(response).to render_template(:index)
      end

      it '3-renders the :show template' do
        get user_path(id: 1)
        expect(response).to render_template(:show)
      end

      it '4-renders the view with the correct placeholder text' do
        get users_path
        expect(response.body).to include('Users List')
      end

      it '5-renders the view with the correct placeholder text' do
        get user_path(id: 1)
        expect(response.body).to include('User Info')
      end
    end
  end
end
