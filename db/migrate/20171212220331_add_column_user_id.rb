class AddColumnUserId < ActiveRecord::Migration[5.1]
  def change
    change_column :questions, :users, :user
  end
end
