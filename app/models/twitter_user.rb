class TwitterUser < ActiveRecord::Base
  has_many :tweets, foreign_key: :owner_id

  validates :nickname, presence: true
  validates :nickname, uniqueness: true
end
