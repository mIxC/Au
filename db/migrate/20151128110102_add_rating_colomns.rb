class AddRatingColomns < ActiveRecord::Migration
  def change

    add_column :users, :wins, :integer
    add_column :users, :loss, :integer
    add_column :users, :draw, :integer


  end
end
