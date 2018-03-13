require 'rails_helper'

module Businesses
  describe BusinessTax do
    describe 'associations' do
      it { is_expected.to belong_to :tax }
      it { is_expected.to belong_to :business }
    end
    describe 'validations' do
      it { is_expected.to validate_uniqueness_of(:tax_id).scoped_to(:business_id) }
    end
  end
end
