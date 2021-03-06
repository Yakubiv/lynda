namespace :import do
  task twitter_users: :environment do
    $client.friends.each do |friend|
      friend_params = {
        name: friend.name,
        nickname: friend.screen_name,
        profile_image_url: friend.profile_image_url,
        tweets_count: friend.tweets_count,
        followers_count: friend.followers_count,
        friends_count: friend.friends_count
      }

      TwitterUser.create(friend_params)
    end

    friend = $client.user
    TwitterUser.create({name: friend.name,
                        nickname: friend.screen_name,
                        profile_image_url: friend.profile_image_url,
                        tweets_count: friend.tweets_count,
                        followers_count:  friend.followers_count,
                        friends_count: friend.friends_count})
  end
end
