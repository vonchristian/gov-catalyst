class BusinessRegistrationForm
  include ActiveModel::Model
  include ActiveModel::Validations

  def save
    ActiveRecord::Base.transaction do
      create_or_find_taxpayer
      create_or_find_business
    end
  end

  private
  def create_or_find_taxpayer
  end
  def create_or_find_business
  end
end
