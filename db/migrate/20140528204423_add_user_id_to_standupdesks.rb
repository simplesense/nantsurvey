class AddUserIdToStandupdesks < ActiveRecord::Migration
  def change
    add_column :standupdesks, :user_id, :integer
    add_index :standupdesks, :user_id
  end
end
