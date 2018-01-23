class AddTypeOfOrganizationToBusinesses < ActiveRecord::Migration[5.2]
  def change
    add_reference :businesses, :type_of_organization, foreign_key: true, type: :uuid
  end
end
