require 'rails_helper'

RSpec.describe AuditLog, type: :model do
  describe 'creation' do
    it 'can be created' do
      log = create(:audit_log)
      p log
      expect(log).to be_valid
    end
  end
end
