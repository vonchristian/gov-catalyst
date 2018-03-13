require 'rails_helper'

module Businesses
describe BusinessOwnership do
  describe 'associations' do
    it { is_expected.to belong_to :business }
    it { is_expected.to belong_to :owner }
  end
end
end
