require 'rails_helper'

RSpec.describe PostsController, type: :controller do
  # render_views

  describe 'GET /show' do
    context 'posts should render correctly' do
      it '1-renders a successful response' do
        get :index, params: { user_id: 1 }
        expect(response).to be_successful
      end

      it '2-renders the index template' do
        user = User.create(name: 'Lilly', photo: '1-photo', bio: 'Teacher from Poland.',
                           posts_counter: 0)
        get :index, params: { user_id: user.id }
        p response
        expect(response).to render_template(:index)
      end

      it '3-renders the index template' do
        user = User.create(name: 'Lilly', photo: '1-photo', bio: 'Teacher from Poland.',
          posts_counter: 0)
        get :index, params: { user_id: user.id }  
        p response.body
        expect(response.body).to include('Posts List')
      end

      it '4-renders the show template' do
        get :show, params: { user_id: 1, id: 1 }
        expect(response).to render_template(:show)
      end

      it '5-renders the show template' do
        get :show, params: { user_id: 1, id: 1 }
        expect(response.body).to include('Post Info')
      end
    end
  end
end
