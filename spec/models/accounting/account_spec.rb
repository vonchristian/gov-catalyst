require 'rails_helper'

module Accounting
  describe Account, type: :model do
    describe 'associations' do
      it { is_expected.to have_many :entries }
      it { is_expected.to have_many :amounts }
    end
  end
end
