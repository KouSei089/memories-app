class AddCreateMemoriesTomemories < ActiveRecord::Migration[6.0]
  def change
    add_column :memories, :artist, :string
    add_column :memories, :song, :string
  end
end
