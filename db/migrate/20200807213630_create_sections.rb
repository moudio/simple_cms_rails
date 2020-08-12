class CreateSections < ActiveRecord::Migration[6.0]
  def up
    create_table :sections do |t|
      t.string :name
      t.integer :position
      t.boolean :visible
      t.string :content_type
      t.integer :page_id
      t.text :content
      t.timestamps
    end
  end
  def down
    drop_table :sections
  end
end
