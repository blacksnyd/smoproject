class CreateGuardings < ActiveRecord::Migration[7.0]
  def change
    create_table :guardings do |t|
      t.string :address
      t.float :latitude
      t.float :longitude
      t.references :admin_user, null: false, foreign_key: true
      t.timestamps
    end
  end
end
