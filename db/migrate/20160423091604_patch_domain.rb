class PatchDomain < ActiveRecord::Migration[5.0]
  def up
    add_column :site_framework_domains, :namespace_id, :integer
  end

  def down
    remove_column :site_framework_domains, :namespace_id
  end
end
