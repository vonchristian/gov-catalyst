require 'rails_helper'

module Businesses
  describe BusinessTax do
    describe 'associations' do
      it { is_expected.to belong_to :tax }
      it { is_expected.to belong_to :business }
      it { is_expected.to belong_to :taxable }
    end
    describe 'validations' do
      it { is_expected.to validate_uniqueness_of(:tax_id).scoped_to(:taxable_id) }
    end
    describe 'delegations' do
      it { is_expected.to delegate_method(:name).to(:tax) }
    end
  end
end
