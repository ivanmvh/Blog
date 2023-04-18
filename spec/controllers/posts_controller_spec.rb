require 'rails_helper'

RSpec.describe PostsController, type: :request do
  describe 'GET /show' do
    context 'posts should render correctly' do
      user = User.create(name: 'Poly Connor', photo: '5-photo.jpg',
                         bio: 'Teacher from Poland.', posts_counter: 0)
      post = Post.create(author: user, title: 'Hello', text: 'This is my first post', comments_counter: 0,
                         likes_counter: 0)
      it '1-renders a successful response' do
        get "/users/#{user.id}/posts"
        expect(response).to be_successful
      end

      it '2-renders the index template' do
        user = User.create(name: 'Poly Connor', photo: '5-photo.jpg',
                           bio: 'Teacher from Poland.', posts_counter: 0)
        post = Post.create(author: user, title: 'Hello', text: 'This is my first post', comments_counter: 0,
                           likes_counter: 0)
        get "/users/#{user.id}/posts"
        expect(response).to render_template(:index)
      end

      it '3-renders the index template' do
        user = User.create(name: 'Poly Connor', photo: '5-photo.jpg',
                           bio: 'Teacher from Poland.', posts_counter: 0)
        post = Post.create(author: user, title: 'Hello', text: 'This is my first post', comments_counter: 0,
                           likes_counter: 0)
        get "/users/#{user.id}/posts"
        expect(response.body).to include('Poly Connor')
      end
    end

    context 'posts should contain the correct information' do
      it '4-renders the show template' do
        user = User.create(name: 'Poly Connor', photo: '5-photo.jpg',
                           bio: 'Teacher from Poland.', posts_counter: 0)
        post = Post.create(author: user, title: 'Hello', text: 'This is my first post', comments_counter: 0,
                           likes_counter: 0)
        get "/users/#{user.id}/posts/#{post.id}"
        expect(response).to render_template(:show)
      end

      it '5-renders the show template' do
        user = User.create(name: 'Poly Connor', photo: '5-photo.jpg',
                           bio: 'Teacher from Poland.', posts_counter: 0)
        post = Post.create(author: user, title: 'Hello', text: 'This is my first post', comments_counter: 0,
                           likes_counter: 0)
        get "/users/#{user.id}/posts/#{post.id}"
        expect(response.body).to include('This is my first post')
      end
    end
  end
end
