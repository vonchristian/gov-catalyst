require 'rails_helper'

module Configurations
  describe Category do
    describe 'associations' do
      it { is_expected.to have_many :tax_brackets }
    end
    describe 'validations' do
      it { is_expected.to validate_presence_of :name }
      it { is_expected.to validate_uniqueness_of :name }
    end
  end
end
