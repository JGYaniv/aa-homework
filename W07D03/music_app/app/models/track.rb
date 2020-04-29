# == Schema Information
#
# Table name: tracks
#
#  id         :bigint           not null, primary key
#  title      :string           not null
#  ord        :integer          not null
#  lyrics     :text
#  album_id   :integer          not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  bonus      :boolean          default(FALSE)
#
class Track < ApplicationRecord
    validates :title, presence: true
    validates :ord, uniqueness: {scope: :album_id}
    belongs_to :album

    has_one :band,
        through: :album,
        source: :band
end
