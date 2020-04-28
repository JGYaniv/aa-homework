class CreateGardens < ActiveRecord::Migration[5.2]
  def change
    create_table :gardens do |t|
      t.string :name
      t.integer :size
      t.integer :user_id

      t.timestamps
    end

    add_index :gardens, :user_id
  end
end
