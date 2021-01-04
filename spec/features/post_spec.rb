# frozen_string_literal: true

require 'rails_helper'

describe 'navigate' do
  let(:user) { User.create!(email: 'test@test.com', password: 'secret', password_confirmation: 'secret', first_name: 'John', last_name: 'mcntyre') }
  before do
    login_as(user, scope: :user)
  end
  describe 'index' do
    before do
      visit posts_path
    end
    it 'can be reached successfully' do
      expect(page.status_code).to eq(200)
    end

    it 'has a title of Posts' do
      expect(page).to have_content(/Posts/)
    end

    it 'has a list of posts' do
      Post.create!(date: Date.today, rationale: 'post 1', user_id: user.id)
      Post.create!(date: Date.today, rationale: 'post 2', user_id: user.id)
      visit posts_path
      expect(page).to have_content(/post 1|post 2/)
    end
  end

  describe 'creation' do
    before do
      visit new_post_path
    end
    it 'has a new form that can be reached' do
      expect(page.status_code).to eq(200)
    end

    it 'can be created from new form page' do
      fill_in 'post[date]', with: Date.today
      fill_in 'post[rationale]', with: 'some rationale'
      click_on 'Save'
      expect(page).to have_content('some rationale')
    end

    it 'will have a user associated with it' do
      fill_in 'post[date]', with: Date.today
      fill_in 'post[rationale]', with: 'some rationale with user'
      click_on 'Save'

      expect(User.last.posts.last.rationale).to eq('some rationale with user')
    end
  end
end
