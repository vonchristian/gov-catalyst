class CreateRequirements < ActiveRecord::Migration[5.2]
  def change
    create_table :requirements, id: :uuid do |t|
      t.string :type

      t.timestamps
    end
    add_index :requirements, :type
  end
end
