class AddMoreFieldsToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :document_number, :string
    add_column :users, :fullname, :string
    add_column :users, :gender, :string
  end
end
