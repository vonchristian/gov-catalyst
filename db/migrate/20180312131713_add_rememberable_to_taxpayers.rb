class AddRememberableToTaxpayers < ActiveRecord::Migration[5.2]
  def change
    add_column :taxpayers, :remember_created_at, :datetime
  end
end
