require 'rails_helper'

RSpec.describe 'Users', type: :request do
  it 'assigns all users to @users' do
    get '/users'
    expect(assigns(:users)).to eq(User.all)
  end

  it 'assigns a particular user' do
    get '/users/1'
    expect(assigns(:user)).to eq(User.find(1))
  end

  it 'assigns all post to @posts' do
    get '/users/1/posts'
    expect(assigns(:posts)).to eq(Post.all)
  end

  it 'Redirects to the all users page' do
    get '/users'
    expect(response).to render_template(:index)
  end

  it "Redirects to a particular user's page" do
    get '/users/1'
    expect(response).to render_template(:show)
  end

  it 'To include a particular text' do
    get '/users'
    expect(response.body).to include('<p>Here is a list of users</p>')
  end

  it 'Redirects to the all users page' do
    get '/users'
    expect(response).to render_template(:index)
  end

  it 'Redirects to a all posts page' do
    get '/users/1/posts'
    expect(response).to render_template(:index)
  end

  it 'To include a particular text' do
    get '/users/1/posts'
    expect(response.body).to include('<p>Here is the list of posts for a given user</p>')
  end

  it "Redirects to a  post's page" do
    get '/users/1/posts/1'
    expect(response).to render_template(:show)
  end

  it 'To include a particular text' do
    get '/users/1/posts/1'
    expect(response.body).to include('<p>Here are the details for a specific post</p>')
  end
end
