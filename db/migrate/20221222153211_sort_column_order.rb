class SortColumnOrder < ActiveRecord::Migration[5.2]
  def change
    change_column :posts, :language, :integer, null: false, after: :url
    change_column :posts, :comment, :string, after: :content
  end
end
