class CreatePodcastsParties < ActiveRecord::Migration[5.0]
  def change
    create_table :podcasts_parties do |t|
      t.integer :episode_id
      t.integer :participant_id
      t.boolean :host, default: false

      t.timestamps
    end
  end
end
