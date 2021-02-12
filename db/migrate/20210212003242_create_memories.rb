class CreateMemories < ActiveRecord::Migration[6.0]
  def change
    create_table :memories do |t|
      t.string :title
      t.string :emotion
      t.text :description
      t.timestamps
    end
  end
end
