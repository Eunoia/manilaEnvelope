class CreateBlogs < ActiveRecord::Migration
  def change
    create_table :blogs do |t|
      t.string :title
      t.text :body
      t.string :name
      t.string :language
      t.integer :user_id

      t.timestamps
    end
  end
end
