class Tweet < ActiveRecord::Base
  belongs_to :twitter_user, foreign_key: :owner_id
  validates :origin_id, uniqueness: true
end
