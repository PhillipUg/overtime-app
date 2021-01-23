require 'rails_helper'

describe 'admin dashboard' do
  it 'can be reached successfully' do
    visit admin_root_path
    expect(page.status_code).to eq(200)
  end

  it 'cannot be reached users who are not signed in' do
    visit admin_root_path
    expect(current_path).to eq(new_user_session_path)
  end

  it 'can be reached by an admin user' do
    admin_user = create(:admin_user)
    login_as(admin_user, scope: :user)

    visit admin_root_path

    expect(current_path).to eq(admin_root_path)
  end

  it 'cannot be reached by a non-admin user' do
    user = create(:user)
    login_as(user, scope: :user)

    visit admin_root_path

    expect(current_path).to eq(root_path)
  end
end
