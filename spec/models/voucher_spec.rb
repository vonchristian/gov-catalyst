require 'rails_helper'

RSpec.describe Voucher, type: :model do
  describe 'associations' do
    it { is_expected.to belong_to :commercial_document }
    it { is_expected.to have_many :voucher_amounts }
  end
end
