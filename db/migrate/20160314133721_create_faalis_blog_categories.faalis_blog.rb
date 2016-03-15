# This migration comes from faalis_blog (originally 20160313105723)
class CreateFaalisBlogCategories < ActiveRecord::Migration
  def change
    create_table :faalis_blog_categories do |t|
        t.string :title
        t.text :description
        t.string :permalink
        t.boolean :private

        t.timestamps null: false
      end

    domain_aware :faalis_blog_categories
  end
end
