class CreateAddresses < ActiveRecord::Migration[5.1]
  def change
    create_table :addresses do |t|
      t.string :country, null: false
      t.string :city, null: false
      t.string :neighborhood, null: false
      t.string :street, null: false
      t.string :zipcode
      t.string :number, null: false
      t.string :complement
      t.references :addressable, polymorphic: true, index: true

      t.timestamps
    end
  end
end
