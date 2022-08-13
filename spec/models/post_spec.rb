require 'rails_helper'

RSpec.describe Post, type: :model do
  subject { Post.new(AuthorId: 13, Title: 'Jordan s post', Text: 'My fourth post on rails') }

  before { subject.save }

  it 'Title should be present' do
    subject.Title = nil
    expect(subject).to_not be_valid
  end

  it 'Text should be present' do
    subject.Title = nil
    expect(subject).to_not be_valid
  end

  it 'Author Id should be integer' do
    subject.AuthorId = '13'
    expect(subject).to_not be_valid
  end

  it 'Author Id should be integer' do
    subject.AuthorId = '13'
    expect(subject).to_not be_valid
  end
end
