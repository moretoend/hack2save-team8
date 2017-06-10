class CreateUserAddresses < ActiveRecord::Migration[5.1]
  def change
    create_table :user_addresses do |t|
      t.string :country, null: false
      t.string :state, null: false
      t.string :city, null: false
      t.string :neighborhood, null: false
      t.string :street, null: false
      t.string :zipcode
      t.string :number, null: false
      t.string :complement
      t.references :user, index: true

      t.timestamps
    end
  end
end
