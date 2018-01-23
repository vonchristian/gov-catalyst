class CreateBusinessActivities < ActiveRecord::Migration[5.2]
  def change
    create_table :business_activities, id: :uuid do |t|
      t.belongs_to :business, foreign_key: true, type: :uuid
      t.belongs_to :business_trade, foreign_key: true, type: :uuid

      t.timestamps
    end
  end
end
