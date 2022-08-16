require 'rails_helper'

RSpec.describe User, type: :model do
  subject { User.create(Name: 'Camilux10', Photo: 'https://unsplash.com/photos/F_-0BxGuVvo', Bio: '10th biographie') }

  before { subject.save }

  it 'Name should be present' do
    subject.Name = nil
    expect(subject).to_not be_valid
  end

  it 'Photo should be present' do
    subject.Photo = nil
    expect(subject).to_not be_valid
  end

  it 'Bio should be present' do
    subject.Bio = 'qwerty'
    expect(subject).to_not be_valid
  end

  it 'PostsCounter should be integer' do
    subject.PostsCounter = nil
    expect(subject).to_not be_valid
  end
end
