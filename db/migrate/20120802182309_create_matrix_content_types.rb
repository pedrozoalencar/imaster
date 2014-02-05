class CreateMatrixContentTypes < ActiveRecord::Migration
  def change
    create_table :matrix_content_types do |t|
      t.integer :matter_father_id
      t.integer :matter_id
      t.integer :content_type_id

      t.timestamps
    end
  end
end
