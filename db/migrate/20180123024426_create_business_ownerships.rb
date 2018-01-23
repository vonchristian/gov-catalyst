class CreateBusinessOwnerships < ActiveRecord::Migration[5.2]
  def change
    create_table :business_ownerships, id: :uuid do |t|
      t.references :owner, polymorphic: true, type: :uuid
      t.belongs_to :business, foreign_key: true, type: :uuid

      t.timestamps
    end
  end
end
