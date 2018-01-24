class AddCostToRequirementApplications < ActiveRecord::Migration[5.2]
  def change
    add_column :requirement_applications, :cost, :decimal
  end
end
