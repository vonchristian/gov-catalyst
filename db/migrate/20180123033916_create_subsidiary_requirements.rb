class CreateSubsidiaryRequirements < ActiveRecord::Migration[5.2]
  def change
    create_table :subsidiary_requirements, id: :uuid do |t|
      t.belongs_to :main_requirement, foreign_key: { to_table: :requirements }, type: :uuid
      t.belongs_to :subsidiary_requirement, foreign_key: { to_table: :requirements }, type: :uuid

      t.timestamps
    end
  end
end
