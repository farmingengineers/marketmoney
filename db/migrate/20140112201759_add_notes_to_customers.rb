class AddNotesToCustomers < ActiveRecord::Migration[4.2]
  def change
    add_column :customers, :notes, :text
  end
end
