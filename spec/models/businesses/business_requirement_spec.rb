require 'rails_helper'

module Businesses
  describe BusinessRequirement do
    describe 'associations' do
      it { is_expected.to belong_to :business }
      it { is_expected.to belong_to :requirement }
      it { is_expected.to have_many :verifications }
      it { is_expected.to have_many :applications }
      it { is_expected.to have_many :approvals }
      it { is_expected.to have_many :revocations }
    end

    describe 'validations' do
      it { is_expected.to validate_uniqueness_of(:requirement_id).scoped_to(:business_id) }
    end
  end
end
