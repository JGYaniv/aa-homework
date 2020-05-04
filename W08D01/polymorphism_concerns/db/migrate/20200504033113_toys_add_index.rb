class ToysAddIndex < ActiveRecord::Migration[5.1]
  def change
    add_index :toys, [:name, :toyable_id, :toyable_type], unique: true
  end
end
