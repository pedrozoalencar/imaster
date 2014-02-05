class AddColumnWorkflowStateToContentType < ActiveRecord::Migration
  def up
    add_column :content_types, :workflow_state, :string, :limit => 40
  end

  def down
    remove_column :content_types, :workflow_state
  end
end
