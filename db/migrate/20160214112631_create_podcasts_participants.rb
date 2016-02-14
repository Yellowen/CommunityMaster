class CreatePodcastsParticipants < ActiveRecord::Migration[5.0]
  def change
    create_table :podcasts_participants do |t|
      t.string :name
      t.text :bio
      t.string :twitter
      t.string :github
      t.string :website
      t.string :linkedin
      t.string :email

      t.timestamps
    end

    domain_aware :podcasts_participants
  end
end
