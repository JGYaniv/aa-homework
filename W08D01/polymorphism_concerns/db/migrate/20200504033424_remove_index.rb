class RemoveIndex < ActiveRecord::Migration[5.1]
  def change
    remove_index :toys, :name
  end
end
