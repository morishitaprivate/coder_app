class AddColumnsToPost < ActiveRecord::Migration[5.2]
  def change
    change_column :posts, :title, :string, null: false
    add_column :posts, :language, :integer, null: false
    add_column :posts, :comment, :string
  end
end
