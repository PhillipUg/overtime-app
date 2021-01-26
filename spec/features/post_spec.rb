# frozen_string_literal: true

require 'rails_helper'

describe 'navigate' do
  before do
    @user = create(:user)
    login_as(@user, scope: :user)
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
      create(:post, user: @user)
      create(:second_post, user: @user)
      visit posts_path
      expect(page).to have_content(/Some Rationale|Some More Content/)
    end

    it 'is scoped so that only post creators can see their posts' do
      create(:post, user: @user)
      create(:second_post, user: @user)
      other_user = create(:non_authorized_user)
      create(:third_post, rationale: 'blah blah', user: other_user)

      login_as(@user, scope: :user)
      visit posts_path

      expect(page).to_not have_content(/blah blah/)
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
      @post = create(:post, user: @user)
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
      fill_in 'post[overtime_request]', with: 4.5
      
      expect { click_on 'Save' }.to change(Post, :count).by(1)
    end

    it 'will have a user associated with it' do
      fill_in 'post[date]', with: Date.today
      fill_in 'post[rationale]', with: 'some rationale with user'
      fill_in 'post[overtime_request]', with: 4.5
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
