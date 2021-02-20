class AddYoutubeurlToCreateMemories < ActiveRecord::Migration[6.0]
  def change
    add_column :memories, :youtubeurl, :string
  end
end
