class AddMainRequirementToRequirements < ActiveRecord::Migration[5.2]
  def change
    add_reference :requirements, :main_requirement, foreign_key: { to_table: :requirements }, type: :uuid
  end
end
