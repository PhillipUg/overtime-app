require 'rails_helper'

RSpec.describe Post, type: :model do
  describe 'Creation' do
    let(:post) { Post.create!(date: Date.today, rationale: 'Anything') }
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
