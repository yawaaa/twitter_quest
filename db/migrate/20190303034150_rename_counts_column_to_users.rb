class RenameCountsColumnToUsers < ActiveRecord::Migration[5.0]
  def change
     rename_column :users, :losses_counts, :losses_count
     rename_column :users, :battles_counts, :battles_count
  end
end
