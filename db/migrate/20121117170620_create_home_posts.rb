class CreateHomePosts < ActiveRecord::Migration
  def change
    create_table :home_posts do |t|
      t.string :title
      t.text :top_body
      t.text :bottom_body
      t.string :top_title
      t.string :bottom_title

      t.timestamps
    end
  end
end
