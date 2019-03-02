class RenameUserCol < ActiveRecord::Migration[5.0]
  def change
    rename_column :users, :atk, :attack
    rename_column :users, :def, :defense
  end
end
