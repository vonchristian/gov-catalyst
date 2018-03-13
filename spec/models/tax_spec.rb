require 'rails_helper'

RSpec.describe Tax, type: :model do
  describe 'associations' do
    it { is_expected.to belong_to :revenue_account }
    it { is_expected.to belong_to :accounts_receivable_account }
  end
end
