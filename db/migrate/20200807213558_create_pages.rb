class CreatePages < ActiveRecord::Migration[6.0]
  def up
    create_table :pages do |t|
      t.string :name
      t.string :permalink
      t.integer :subject_id
      t.boolean :visible, default: false
      t.timestamps
    end
  add_index(:pages, "subject_id")
  add_index(:pages, "permalink")
  end
  def down
    drop_table :pages
  end
end
