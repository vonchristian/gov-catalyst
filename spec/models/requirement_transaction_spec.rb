require 'rails_helper'

describe RequirementTransaction, type: :model do
  describe 'associations' do
    it { is_expected.to belong_to :client }
    it { is_expected.to belong_to :business_requirement }
  end
end
