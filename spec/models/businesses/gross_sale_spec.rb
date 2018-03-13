require 'rails_helper'

module Businesses
  describe GrossSale, type: :model do
    describe 'associations' do
      it { is_expected.to belong_to :business }
    end
  end
end
