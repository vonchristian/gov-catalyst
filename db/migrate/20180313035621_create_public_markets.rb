class CreatePublicMarkets < ActiveRecord::Migration[5.2]
  def change
    create_table :public_markets, id: :uuid do |t|
      t.string :name
      t.string :address

      t.timestamps
    end
  end
end
