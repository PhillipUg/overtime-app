require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = create(:user)
  end
  describe 'creation' do
    it 'can be created' do
      expect(@user).to be_valid
    end

    it 'cannot be created without a first_name' do
      @user.first_name = nil
      expect(@user).to_not be_valid
    end

    it 'cannot be created without a last_name' do
      @user.last_name = nil
      expect(@user).to_not be_valid
    end

    it 'cannot be created without a phone' do
      @user.phone = nil
      expect(@user).to_not be_valid
    end
  end

  describe 'custom name method' do
    it 'has a full name method that combines first and last names' do
      expect(@user.full_name).to eq("Mcntyre, John")
    end
  end
end
