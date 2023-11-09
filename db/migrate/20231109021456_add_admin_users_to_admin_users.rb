class AddAdminUsersToAdminUsers < ActiveRecord::Migration[7.0]
  def change
    add_reference :admin_users, :admin_user, null: true, foreign_key: true
  end
end
