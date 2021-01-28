require 'rails_helper'

describe 'AuditLog Feature' do
  # let(:audit_log) { create(:audit_log) }
  before do
    admin_user = create(:admin_user)
    login_as(admin_user, scope: :user)
  end
  describe 'index' do
    it 'has index page that can be reached' do
      visit audit_logs_path
      expect(page.status_code).to eq(200)
    end

    it 'cannot be accessed by a non-admin user' do
     logout(:user)
     user = create(:user)
     login_as(user, scope: :user)
     
     visit audit_logs_path

     expect(current_path).to eq(posts_path)
    end

    it 'renders audit logs content' do
      create(:audit_log)
      visit audit_logs_path
      expect(page).to have_content(/John|Mcntyre/)
    end
  end
end
