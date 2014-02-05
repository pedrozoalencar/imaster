class CreateArticles < ActiveRecord::Migration
  def change
    create_table :articles do |t|
      t.integer :matrix_content_type_id
      t.string :title
      t.text :content
      t.string :workflow_state

      t.timestamps
    end
  end
end
