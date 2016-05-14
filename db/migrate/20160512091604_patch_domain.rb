class PatchDomain < ActiveRecord::Migration[5.0]
  def up
    add_column :site_framework_domains, :namespace_id, :integer
    add_column :site_framework_domains, :user_id, :integer
  end

  def down
    remove_column :site_framework_domains, :namespace_id
    remove_column :site_framework_domains, :user_id
  end
end
