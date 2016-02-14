class CreatePodcastsEpisodes < ActiveRecord::Migration[5.0]
  def change
    create_table :podcasts_episodes do |t|
      t.string :title
      t.integer :number
      t.integer :user_id
      t.text :description

      t.timestamps
    end
  end
end
