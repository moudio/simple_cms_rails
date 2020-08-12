class UpdatePage < ActiveRecord::Migration[6.0]
  def up
    add_column('pages', 'position', :integer, after: :permalink)
  end

  def down
    remove_column('pages', 'position')
  end
end
