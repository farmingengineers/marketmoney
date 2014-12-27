class UniqueUsername < ActiveRecord::Migration
  def change
    add_index :admins, [:provider, :username], :unique => true
  end
end
