class CreateRequirementApprovals < ActiveRecord::Migration[5.2]
  def change
    create_table :requirement_approvals, id: :uuid do |t|
      t.references :approver, polymorphic: true
      t.datetime :date_approved
      t.references :approved_document, polymorphic: true, index: { name: "index_approved_document_on_requirement_approvals" }

      t.timestamps
    end
  end
end
