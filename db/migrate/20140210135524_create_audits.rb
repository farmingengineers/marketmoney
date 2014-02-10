class CreateAudits < ActiveRecord::Migration
  def change
    create_table :audits do |t|
      t.belongs_to :admin
      t.text :json_data

      t.timestamps
    end
  end
end
