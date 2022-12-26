class ChangeDataTypeToCommentOfPost < ActiveRecord::Migration[5.2]
  def change
    change_column :posts, :comment, :text
  end
end
