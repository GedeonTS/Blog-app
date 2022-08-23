require 'rails_helper'

RSpec.describe Post, type: :view do
  before :each do
    @user = User.create(name: 'Tom', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Teacher from Mexico.')
    @user.posts.create(title: 'Title', text: 'Body')
    visit user_post_path(@user, @user.posts.first)
  end

  it 'Should display post\s title' do
    expect(page).to have_content('Title')
  end
  it 'Should display post author name' do
    expect(page).to have_content('Tom')
  end

  it 'should display comment counter' do
    expect(page).to have_content('Comments')
  end

  it 'Shows how many likes a post has' do
    expect(page).to have_content('Likes: 0')
  end

  it 'Should display text' do
    expect(page).to have_content('Body')
  end

  it 'Should display comment user name' do
    @user.posts.first.comments.create(text: 'Comment sample', author_id: @user)
    visit user_post_path(@user, @user.posts.first)
    expect(page).to have_content('Tom')
  end

  it 'Should content See all posts button' do
    visit user_path(@user.id)
    expect(page).to have_content('Title')
    expect(page).to have_content('See all posts')
  end
end
