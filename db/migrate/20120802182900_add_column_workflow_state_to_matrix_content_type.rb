class AddColumnWorkflowStateToMatrixContentType < ActiveRecord::Migration
  def up
    add_column :matrix_content_types, :workflow_state, :string, :limit => 40
  end

  def down
    remove_column :matrix_content_types, :workflow_state
  end
end
