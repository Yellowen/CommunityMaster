class CreatePodcastsEpisodes < ActiveRecord::Migration[5.0]
  def change
    create_table :podcasts_episodes do |t|
      t.string :title
      t.integer :number
      t.integer :user_id
      t.text :description

      t.timestamps
    end

    add_attachment :podcasts_episodes, :ogg
    add_attachment :podcasts_episodes, :mp3
    add_attachment :podcasts_episodes, :cover

    add_index :podcasts_episodes, :number
    site_aware :podcasts_episodes
  end
end
