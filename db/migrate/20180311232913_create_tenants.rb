class CreateTenants < ActiveRecord::Migration[5.2]
  def change
    create_table :tenants, id: :uuid do |t|
      t.string :name
      t.string :address
      t.string :contact_number

      t.timestamps
    end
  end
end
