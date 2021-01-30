require 'rails_helper'

describe 'Homepage' do
  it 'allows the admin to approve posts from the homepage' do
    post = create(:post)
    admin_user = create(:admin_user)
    login_as(admin_user, scope: :user)

    visit root_path
    click_on("approve_#{post.id}")

    expect(post.reload.status).to eq('approved')
  end

  it 'allows employee to change audit log status from the homepage' do
    user = create(:user)
    audit_log = create(:audit_log, user: user)
    login_as(user, scope: :user)

    visit root_path
    click_on("confirm_#{audit_log.id}")

    expect(audit_log.reload.status).to eq('confirmed')
  end
end