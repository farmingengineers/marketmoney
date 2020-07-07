class CreateAdmins < ActiveRecord::Migration[4.2]
  def change
    create_table :admins do |t|
      t.string :provider
      t.string :uid
      t.string :username
      t.boolean :enabled

      t.timestamps
    end
    add_index :admins, [:provider, :uid]
  end
end
