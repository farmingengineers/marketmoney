class CustomerSlugAndAdminProviderUidAreUnique < ActiveRecord::Migration[4.2]
  def up
    remove_index :admins, [:provider, :uid]
    add_index :admins, [:provider, :uid], :unique => true, :name => 'admin_by_uid'
    add_index :customers, :slug, :unique => true, :name => 'customer_by_slug'
  end

  def down
    remove_index :admins, :name => 'admin_by_uid'
    remove_index :customers, :name => 'customer_by_slug'
    add_index :admins, [:provider, :uid]
  end
end
