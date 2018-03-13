module Configurations
  class RequirementCreation
    include ActiveModel::Model
    attr_accessor :name
    validates :name, presence: true, uniqueness: true
    def save
      ActiveRecord::Base.transaction do
        create_requirement
      end
    end

    private
    def create_requirement
    end
  end
end
