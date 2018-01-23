class CreateAccounts < ActiveRecord::Migration[5.2]
  def change
    create_table :accounts, id: :uuid do |t|
      t.string :name
      t.string :code
      t.string :type
      t.boolean :contra, default: false

      t.timestamps
    end
    add_index :accounts, :name, unique: true
    add_index :accounts, :code, unique: true
    add_index :accounts, :type
  end
end
