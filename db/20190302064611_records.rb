class Records < ActiveRecord::Migration[5.0]
  def change
    drop_table :battles
  end
end
