require 'rails_helper'

RSpec.describe Amount, type: :model do
  describe 'associations' do
    it { is_expected.to belong_to :account }
    it { is_expected.to belong_to :entry }
    it { is_expected.to belong_to :commercial_document }
  end
end
