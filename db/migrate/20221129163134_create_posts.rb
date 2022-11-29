class CreatePosts < ActiveRecord::Migration[5.2]
  def change
    create_table :posts do |t|
      t.references :user, null: false, foreign_key: true
      t.string :title
      t.string :url
      t.text :content, null: false

      t.timestamps
    end
  end
end
