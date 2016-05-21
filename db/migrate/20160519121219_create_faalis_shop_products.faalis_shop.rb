# This migration comes from faalis_shop (originally 20160511132828)
class CreateFaalisShopProducts < ActiveRecord::Migration
  def change
    args = {}
    args[:id] = :uuid if Faalis::Engine.use_uuid

    create_table :faalis_shop_products, **args do |t|
      t.string :name
      t.float :price
      t.integer :category_id
      t.boolean :lock
      t.boolean :private
      t.text :description

      t.timestamps null: false

      if Faalis::Engine.use_uuid
        t.uuid :user_id
      else
        t.integer :user_id
      end

    end

    args[:id] = :uuid if Faalis::Engine.use_uuid
    site_aware :faalis_shop_products
  end
end
