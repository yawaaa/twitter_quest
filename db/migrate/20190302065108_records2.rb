class Records2 < ActiveRecord::Migration[5.0]
  def change
    drop_table :relationships
  end
end
