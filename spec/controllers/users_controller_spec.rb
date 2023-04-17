require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  render_views

  describe 'GET /show' do
    context 'users should render correctly' do
      it '1-renders a successful response' do
        get :index
        expect(response).to be_successful
      end

      it '2-renders the correct template' do
        get :index
        expect(response).to render_template(:index)
      end

      it '3-renders the correct template' do
        get :show, params: { id: 1 }
        expect(response).to render_template(:show)
      end

      it '4-renders the view with the correct placeholder text' do
        get :index
        expect(response.body).to include('Users List')
      end

      it '5-renders the view with the correct placeholder text' do
        get :show, params: { id: 1 }
        expect(response.body).to include('Users Info')
      end
    end
  end
end
