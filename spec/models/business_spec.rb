require 'rails_helper'

describe Business do
  describe 'associations' do
    it { is_expected.to belong_to :type_of_organization }
    it { is_expected.to have_many :business_ownerships }
    it { is_expected.to have_many :taxpayer_owners }
    it { is_expected.to have_many :gross_sales }
    it { is_expected.to have_many :fee_selections }
    it { is_expected.to have_many :fees }
  end
end
