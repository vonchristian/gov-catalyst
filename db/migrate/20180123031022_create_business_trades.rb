class CreateBusinessTrades < ActiveRecord::Migration[5.2]
  def change
    create_table :business_trades, id: :uuid do |t|
      t.belongs_to :sub_category, foreign_key: true, type: :uuid
      t.string :name

      t.timestamps
    end
  end
end
