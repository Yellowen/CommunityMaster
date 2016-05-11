# This migration comes from faalis_page (originally 20160312114123)
class CreateFaalisPageMenus < ActiveRecord::Migration
  def change
    args = {}
    args[:id] = :uuid if Faalis::Engine.use_uuid

    create_table :faalis_page_menus, **args do |t|
      t.string :title
      t.boolean :published, default: false

      if Faalis::Engine.use_uuid
        t.uuid :user_id
      else
        t.integer :user_id
      end

      t.json :data

      t.timestamps null: false
    end

    site_aware :faalis_page_menus
  end
end
