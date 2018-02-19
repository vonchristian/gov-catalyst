class CreateBusinessRequirements < ActiveRecord::Migration[5.2]
  def change
    create_table :business_requirements, id: :uuid do |t|
      t.belongs_to :business, foreign_key: true, type: :uuid
      t.belongs_to :requirement, foreign_key: true, type: :uuid
    end
  end
end
