require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = User.create!(email: 'test@test.com', password: 'secret', password_confirmation: 'secret', first_name: 'John', last_name: 'mcntyre')
  end
  describe 'creation' do
    it 'can be created' do
      expect(@user).to be_valid
    end

    it 'cannot be created without a first_name and last_name' do
      @user.first_name = nil
      @user.last_name = nil

      expect(@user).to_not be_valid
    end
  end

  describe 'custom name method' do
    it 'has a full name method that combines first and last names' do
      expect(@user.full_name).to eq("Mcntyre, John")
    end
  end
end
