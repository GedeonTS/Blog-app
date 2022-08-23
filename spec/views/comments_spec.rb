require 'rails_helper'

RSpec.describe Comment, type: :view, js: true do
  before :each do
    @user = User.create(name: 'Liam', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Teacher from Mexico.')
    @user.posts.create(title: 'Title', text: 'Body')
  end

  # it 'Should display comment counter' do
  #   visit users_path
  #     click_link 'Liam'
  #     expect(page).to have_content('See all posts')
  #   end

  #   it 'Should display comment counter' do
  #     visit user_posts_path(@user.id)
  #     expect(page).to have_content('Comments')
  #   end

  #   it 'Should display comment counter in post view' do
  #     visit user_posts_path(@user.id)
  #     click_link 'Title'
  #     expect(page).to have_content('Comments')
  #   end
end
