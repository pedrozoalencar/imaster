class AddColumnnWorkflowStateAsk < ActiveRecord::Migration
  def up
    add_column :asks, :workflow_state, :string, :limit => 40
  end

  def down
    remove_column :asks, :workflow_state
  end
end
