class AddNameToRequirements < ActiveRecord::Migration[5.2]
  def change
    add_column :requirements, :name, :string
  end
end
