class CreateStalls < ActiveRecord::Migration[5.2]
  def change
    create_table :stalls, id: :uuid do |t|
      t.belongs_to :public_market, foreign_key: true, type: :uuid
      t.belongs_to :business, foreign_key: true, type: :uuid
      t.integer :tenant_type

      t.timestamps
    end
    add_index :stalls, :tenant_type
  end
end
