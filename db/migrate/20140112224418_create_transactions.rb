class CreateTransactions < ActiveRecord::Migration[4.2]
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
