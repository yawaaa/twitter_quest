class CreateSkills < ActiveRecord::Migration[5.0]
  def change
    create_table :skills do |t|
      t.integer :type_id
      t.string :name
      t.float :value
      t.text :effect_description
      t.text :requirement_description

      t.timestamps
    end
  end
end
