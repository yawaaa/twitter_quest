class CreateUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :users do |t|
      t.string :name
      t.string :twitter_ID
      t.string :name
      t.text :img_url
      t.text :description
      t.integer :listed_count
      t.integer :tweet_count
      t.integer :followings_count
      t.integer :followers_count
      t.integer :favorites_count
      t.boolean :is_verified
      t.datetime :twitter_created_date
      t.integer :hp
      t.integer :atk
      t.integer :def
      t.integer :tp
      t.integer :gold

      t.timestamps
    end
  end
end
