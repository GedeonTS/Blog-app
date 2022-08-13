require 'rails_helper'

RSpec.describe Like, type: :model do
  subject { Like.new(AuthorId: 1, PostId: 2) }

  before { subject.save }

  it 'Author Id should be integer' do
    subject.AuthorId = '1'
    expect(subject).to_not be_valid
  end

  it 'Author Id should be integer' do
    subject.PostId = '7'
    expect(subject).to_not be_valid
  end
end
