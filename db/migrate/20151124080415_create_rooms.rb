class CreateRooms < ActiveRecord::Migration
  def change
    create_table :rooms do |t|
      t.string :first_user
      t.string :second_user
      t.boolean :ending, default :FALSE

      t.timestamps null: false
    end
  end
end
