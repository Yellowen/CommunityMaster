# This migration comes from faalis_page (originally 20160312114123)
class CreateFaalisPageMenus < ActiveRecord::Migration
  def change
    create_table :faalis_page_menus do |t|
      t.string :title
      t.integer :site_id
      t.boolean :published, default: false
      t.integer :user_id
      t.json :items

      t.timestamps null: false
    end

    add_index :faalis_page_menus, :site_id
    domain_aware :faalis_page_menus
  end
end
