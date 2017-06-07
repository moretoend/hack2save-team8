class CreateReviews < ActiveRecord::Migration[5.1]
  def change
    create_table :reviews do |t|
      t.references :subscription, foreign_key: true
      t.references :job, foreign_key: true
      t.integer :grade
      t.text :notes

      t.timestamps
    end
  end
end
