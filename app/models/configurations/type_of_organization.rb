module Configurations
  class TypeOfOrganization < ApplicationRecord
    has_many :businesses

    validates :name, presence: true, uniqueness: true
  end
end
