class AddUserIdToCcase < ActiveRecord::Migration[5.0]
  def change
    add_column :ccases, :user_id, :integer

  end
end
