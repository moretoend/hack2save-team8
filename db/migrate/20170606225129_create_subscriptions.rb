class CreateSubscriptions < ActiveRecord::Migration[5.1]
  def change
    create_table :subscriptions do |t|
      t.references :user, foreign_key: true
      t.references :job, foreign_key: true
      t.text :notes
      t.integer :status

      t.timestamps
    end
  end
end
