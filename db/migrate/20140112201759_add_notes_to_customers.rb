class AddNotesToCustomers < ActiveRecord::Migration
  def change
    add_column :customers, :notes, :text
  end
end
