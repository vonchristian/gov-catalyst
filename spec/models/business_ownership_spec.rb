require 'rails_helper'

describe BusinessOwnership, type: :model do
  describe 'associations' do
    it { is_expected.to belong_to :business }
    it { is_expected.to belong_to :owner }
  end
end
