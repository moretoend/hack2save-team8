class ChangeStatusToStringToSubscriptions < ActiveRecord::Migration[5.1]
  def up
    change_column :subscriptions, :status, :string
  end

  def down
    change_column :subscriptions, :status, :integer
  end
end
