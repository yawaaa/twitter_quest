class AddUidsToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :uid, :string, after: :id
  end
end