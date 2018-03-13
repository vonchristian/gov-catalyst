require 'rails_helper'

RSpec.describe Fee, type: :model do
  describe 'associations' do
    it { is_expected.to belong_to :accounts_receivable_account }
    it { is_expected.to belong_to :revenue_account }
  end
end
