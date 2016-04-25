class PatchSite < ActiveRecord::Migration[5.0]
  def up
    add_column :site_framework_sites, :user_id, :integer
    add_column :site_framework_sites, :locked,   :boolean
    add_column :site_framework_sites, :settings, :json
    add_column :site_framework_sites, :site_category_id, :integer
  end

  def down
    remove_column :site_framework_sites, :user_id
    remove_column :site_framework_sites, :locked
    remove_column :site_framework_sites, :settings
    remove_column :site_framework_sites, :site_category_id
  end
end
