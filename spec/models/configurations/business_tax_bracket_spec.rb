require 'rails_helper'

module Configurations
  describe BusinessTaxBracket do
    describe 'associations' do
      it { is_expected.to belong_to :category }
    end
    it "#range" do
      tax_bracket = build(:business_tax_bracket, minimum_gross_sale: 1, maximum_gross_sale: 100)

      expect(tax_bracket.range).to eql 1..100
    end
  end
end
