require 'rails_helper'

RSpec.describe Post, type: :model do
  describe 'Creation' do
    let(:user) { create(:user) }
    let(:post) { create(:post) }
    it 'can be created' do
      expect(post).to be_valid
    end

    it 'cannot be created without a date, rationale and an overtime_request' do
      post.date = nil
      post.rationale = nil
      post.overtime_request = nil
      expect(post).to_not be_valid
    end

    it 'has an overtime request greater than 0.0' do
      post.overtime_request = 0.0

      expect(post).to_not be_valid
    end
  end
end
