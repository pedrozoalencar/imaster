class CreateMatters < ActiveRecord::Migration
  def change
    create_table :matters do |t|
      t.string :name
      t.integer :matter_father_id
      t.string :workflow_state

      t.timestamps
    end
  end
end
