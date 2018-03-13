class AddCategoryToBusinesses < ActiveRecord::Migration[5.2]
  def change
    add_reference :businesses, :category, foreign_key: true, type: :uuid
  end
end
