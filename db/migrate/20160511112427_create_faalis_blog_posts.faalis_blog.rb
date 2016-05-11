# This migration comes from faalis_blog (originally 20160219191902)
class CreateFaalisBlogPosts < ActiveRecord::Migration
  def change
    args = {}
    args[:id] = :uuid if Faalis::Engine.use_uuid

    create_table :faalis_blog_posts, **args do |t|
      t.string :title
      t.string :permalink
      t.text   :raw_content
      t.text   :content
      if  Faalis::Engine.use_uuid
        t.uuid :category_id
        t.uuid :user_id
      else
        t.integer :category_id
        t.integer :user_id
      end

      t.boolean :published
      t.boolean :allow_comments, default: true
      t.boolean :members_only, default: false

      t.string :meta_title
      t.string :meta_description

      t.timestamps null: false
    end

    add_index :faalis_blog_posts, :category_id
    site_aware :faalis_blog_posts
  end
end
