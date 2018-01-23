class CreateTypeOfOrganizations < ActiveRecord::Migration[5.2]
  def change
    create_table :type_of_organizations, id: :uuid do |t|
      t.string :name

      t.timestamps
    end
    add_index :type_of_organizations, :name, unique: true
  end
end
