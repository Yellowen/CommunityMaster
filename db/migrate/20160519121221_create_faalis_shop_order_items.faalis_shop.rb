# This migration comes from faalis_shop (originally 20160516123855)
class CreateFaalisShopOrderItems < ActiveRecord::Migration
  def change
    args = {}
    args[:id] = :uuid if Faalis::Engine.use_uuid

    create_table :faalis_shop_order_items, **args do |t|
      t.integer :product_id
      t.integer :quantity
      t.integer :total

      if Faalis::Engine.use_uuid
        t.uuid :user_id
        t.uuid :order_id
      else
        t.integer :user_id
        t.integer :order_id
      end

      t.timestamps null: false
    end
    site_aware :faalis_shop_order_items
  end
end
