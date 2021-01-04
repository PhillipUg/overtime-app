require 'rails_helper'

RSpec.describe Post, type: :model do
  describe 'Creation' do
    let(:user) {User.create!(email: 'test@test.com', password: 'secret', password_confirmation: 'secret', first_name: 'John', last_name: 'mcntyre')}
    let(:post) { Post.create!(date: Date.today, rationale: 'Anything', user_id: user.id) }
    it 'can be created' do
      expect(post).to be_valid
    end

    it 'cannot be created without a date and a rationale' do
      post.date = nil
      post.rationale = nil
      expect(post).to_not be_valid
    end
  end
end
