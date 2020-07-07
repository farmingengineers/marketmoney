class CreateCustomers < ActiveRecord::Migration[4.2]
  def change
    create_table :customers do |t|
      t.string :name
      t.string :slug

      t.timestamps
    end
  end
end
