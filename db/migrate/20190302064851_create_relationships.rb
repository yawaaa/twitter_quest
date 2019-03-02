class CreateRelationships < ActiveRecord::Migration[5.0]
  def change
    create_table :relationships do |t|
      t.references :user, foreign_key: true
      t.references :challenge, foreign_key: { to_table: :users }
      t.integer :winner

      t.timestamps
    end
  end
end
