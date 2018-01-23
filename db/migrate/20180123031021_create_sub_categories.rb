class CreateSubCategories < ActiveRecord::Migration[5.2]
  def change
    create_table :sub_categories, id: :uuid do |t|
      t.belongs_to :category, foreign_key: true, type: :uuid
      t.string :name

      t.timestamps
    end
    add_index :sub_categories, :name, unique: true
  end
end
