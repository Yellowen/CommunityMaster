# == Schema Information
#
# Table name: podcasts_episodes
#
#  id                 :integer          not null, primary key
#  title              :string
#  number             :integer
#  user_id            :integer
#  description        :text
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#  ogg_file_name      :string
#  ogg_content_type   :string
#  ogg_file_size      :integer
#  ogg_updated_at     :datetime
#  mp3_file_name      :string
#  mp3_content_type   :string
#  mp3_file_size      :integer
#  mp3_updated_at     :datetime
#  cover_file_name    :string
#  cover_content_type :string
#  cover_file_size    :integer
#  cover_updated_at   :datetime
#  site_id            :integer
#

class Podcasts::Episode < ActiveRecord::Base

  acts_as_commentable

  include  Faalis::Concerns::Authorizable

  belongs_to :user, class_name: 'Faalis::User'
  has_many   :parties

  has_attached_file(:ogg,
                    url: '/:class/:attachment/:style/:basename.:extension',
                    path: ':rails_root/public/:class/:attachment/:style/:basename.:extension')

  validates_attachment(:ogg,
                       content_type: { content_type: 'application/ogg' },
                       size: { in: 0..200000.kilobytes })

  has_attached_file(:mp3,
                    url: '/:class/:attachment/:style/:basename.:extension',
                    path: ':rails_root/public/:class/:attachment/:style/:basename.:extension')

  validates_attachment(:mp3,
                       content_type: { content_type: 'audio/mpeg' },
                       size: { in: 0..200000.kilobytes })

  has_attached_file(:cover,
                    styles: {
                              thumb: ['150x150', :jpg],
                              normal: ['400x400', :jpg],
                             },
                    url: '/:class/:attachment/:style/:basename.:extension',
                    path: ':rails_root/public/:class/:attachment/:style/:basename.:extension')

  validates_attachment(:cover,
                       content_type: { content_type: /\Aimage/ },
                       size: { in: 0..10000.kilobytes })

end
