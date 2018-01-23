class CreateBusinessAreas < ActiveRecord::Migration[5.2]
  def change
    create_table :business_areas, id: :uuid do |t|
      t.belongs_to :business, foreign_key: true, type: :uuid
      t.decimal :area

      t.timestamps
    end
  end
end
