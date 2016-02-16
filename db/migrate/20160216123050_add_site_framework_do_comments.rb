class AddSiteFrameworkDoComments < ActiveRecord::Migration[5.0]
  def change
    domain_aware :faalis_comments
  end
end
