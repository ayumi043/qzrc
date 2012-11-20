class CreateJobs < ActiveRecord::Migration
  def change
    create_table :jobs do |t|
  	  t.string :name
      t.text :description
      t.string :contact
      t.integer :company_id
      t.timestamps
    end
  end
end
