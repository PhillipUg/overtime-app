# frozen_string_literal: true

require 'rails_helper'

describe 'navigate' do
  let(:user) { create(:user) }
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
      create(:post)
      create(:second_post)
      visit posts_path
      expect(page).to have_content(/Some Rationale|Some More Content/)
    end
  end

  describe 'new' do
    it 'has a link from the homepage' do
      visit root_path

      click_link('new_post_from_nav')
      expect(page.status_code).to eq(200)
    end
  end

  describe 'delete' do
    before do
      @post = create(:post)
    end
    it 'can be deleted' do
      visit posts_path

       click_link("delete_post_#{@post.id}")
      expect(page.status_code).to eq(200)
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

  describe 'edit' do
    before do
      @edit_user = create(:user)
      login_as(@edit_user, scope: :user)
      @edit_post = create(:post, user: @edit_user)
    end
  
    it 'can be edited' do
      visit edit_post_path(@edit_post)
      fill_in 'post[date]', with: Date.tomorrow
      fill_in 'post[rationale]', with: 'edited content'
      click_on 'Save'
      expect(page).to have_content('edited content')
    end
  end
end
