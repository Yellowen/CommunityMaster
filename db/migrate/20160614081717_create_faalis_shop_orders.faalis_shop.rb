# This migration comes from faalis_shop (originally 20160516123338)
class CreateFaalisShopOrders < ActiveRecord::Migration
  def change
    args = {}
    args[:id] = :uuid if Faalis::Engine.use_uuid

    create_table :faalis_shop_orders, **args do |t|
      t.integer :status

      if Faalis::Engine.use_uuid
        t.uuid :user_id
      else
        t.integer :user_id
      end

      t.timestamps null: false
    end
    site_aware :faalis_shop_orders
  end
end
