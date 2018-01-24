class CreateRequirementApplications < ActiveRecord::Migration[5.2]
  def change
    create_table :requirement_applications, id: :uuid do |t|
      t.belongs_to :requirement, foreign_key: true, type: :uuid
      t.references :applicant, polymorphic: true, type: :uuid, index: { name: 'index_requirement_applications_on_applicant' }
      t.datetime :application_date

      t.timestamps
    end
  end
end
