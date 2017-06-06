class CreateJobs < ActiveRecord::Migration[5.1]
  def change
    create_table :jobs do |t|
      t.references :organization, foreign_key: true
      t.string :title
      t.integer :kind
      t.string :places
      t.text :description
      t.date :start_date
      t.date :end_date

      t.timestamps
    end
  end
end
