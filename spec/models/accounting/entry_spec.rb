require 'rails_helper'

module Accounting
  describe Entry, type: :model do
    describe 'associations' do
      it { is_expected.to belong_to :commercial_document }
      it { is_expected.to belong_to :origin }
      it { is_expected.to have_many :amounts }
    end
  end
end
