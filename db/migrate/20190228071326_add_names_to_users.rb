class AddNamesToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :name, :string, after: :twitter_ID
  end
end
