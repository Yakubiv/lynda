module ApplicationHelper
  def twitter_users
    TwitterUser.all.map{|user| ["#{user.name} @#{user.nickname}", user.nickname]}
  end
end
