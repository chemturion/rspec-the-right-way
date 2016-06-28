class CreateBlogs < ActiveRecord::Migration
  def change
    create_table :blogs do |t|
      t.string :title
      t.string :permalink
      t.string :comments_feed_url

      t.timestamps null: false
    end
  end
end
