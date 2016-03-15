# This migration comes from faalis_blog (originally 20160219191902)
class CreateFaalisBlogPosts < ActiveRecord::Migration
  def change
    create_table :faalis_blog_posts do |t|
        t.string :title
        t.text   :content
        t.integer :category_id
        t.boolean :published
        t.integer :user_id
        t.integer :views
        t.integer :likes
        t.integer :dislikes
        t.boolean :allow_comments
        t.string :meta_title
        t.string :meta_description

        t.timestamps null: false
      end

    add_index :faalis_blog_posts, :category_id
    domain_aware :faalis_blog_posts
  end
end
