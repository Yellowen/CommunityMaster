class CreatePodcastsLinks < ActiveRecord::Migration[5.0]
  def change
    create_table :podcasts_links do |t|
      t.string :title
      t.string :href
      t.text :desc
      t.integer :episode_id

      t.timestamps
    end

    site_aware :podcasts_links
  end
end
