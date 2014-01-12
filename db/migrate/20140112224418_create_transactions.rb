class CreateTransactions < ActiveRecord::Migration
  def change
    create_table :transactions do |t|
      t.date :occurred_on
      t.string :description
      t.float :amount
      t.belongs_to :customer

      t.timestamps
    end
  end
end
