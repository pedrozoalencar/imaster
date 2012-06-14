class CreateAsks < ActiveRecord::Migration
  def change
    create_table :asks do |t|
      t.string :description
      t.text :details

      t.timestamps
    end
  end
end
