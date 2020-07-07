class UniqueUsername < ActiveRecord::Migration[4.2]
  def change
    add_index :admins, [:provider, :username], :unique => true
  end
end
