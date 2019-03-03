class AddUsersToWinLoseCount < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :wins_count, :integer
    add_column :users, :losses_counts, :integer
    add_column :users, :battles_counts, :integer
  end
end
