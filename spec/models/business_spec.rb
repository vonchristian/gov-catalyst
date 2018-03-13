require 'rails_helper'

describe Business do
  describe 'associations' do
    it { is_expected.to belong_to :type_of_organization }
    it { is_expected.to have_many :business_ownerships }
    it { is_expected.to have_many :taxpayer_owners }
    it { is_expected.to have_many :gross_sales }
    it { is_expected.to have_many :business_activities }
    it { is_expected.to have_many :business_trades }
    it { is_expected.to have_many :business_fees }
    it { is_expected.to have_many :fees }
    it { is_expected.to have_many :business_taxes }
    it { is_expected.to have_many :taxes }
    it { is_expected.to have_many :business_requirements }
    it { is_expected.to have_many :requirements }
  end

  it "#business_owners" do
    business = create(:business, name: Faker::Business.name)
    taxpayer = create(:taxpayer)
    business_ownership = create(:business_ownership, owner: taxpayer, business: business)

    expect(business.business_owners).to include(taxpayer)
  end
end
