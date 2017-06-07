class CreateOrganizations < ActiveRecord::Migration[5.1]
  def change
    create_table :organizations do |t|
      t.string :name, null: false
      t.string :cnpj, null: false
      t.string :phone, null: false
      t.string :email
      t.string :about
      t.integer :service_kind

      t.timestamps
    end
  end
end
