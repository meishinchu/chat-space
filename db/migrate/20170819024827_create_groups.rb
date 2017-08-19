class CreateGroups < ActiveRecord::Migration[5.0]
  def change
    create_table :groups do |t|
      t.string :group_id
      t.integer :group_name

      t.timestamps
    end
  end
end
