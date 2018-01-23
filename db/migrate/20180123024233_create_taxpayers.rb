class CreateTaxpayers < ActiveRecord::Migration[5.2]
  def change
    create_table :taxpayers, id: :uuid do |t|
      t.string :first_name
      t.string :middle_name
      t.string :last_name
      t.string :contact_number
      t.string :email
      t.datetime :date_of_birth
      t.integer :sex

      t.timestamps
    end
    add_index :taxpayers, :email, unique: true
    add_index :taxpayers, :sex
  end
end
