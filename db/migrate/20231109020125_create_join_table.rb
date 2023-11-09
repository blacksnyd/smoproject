class CreateJoinTable < ActiveRecord::Migration[7.0]
  def change
    create_join_table :users, :guardings do |t|
      t.index [:user_id, :guarding_id]
      t.index [:guarding_id, :user_id]
    end
  end
end
