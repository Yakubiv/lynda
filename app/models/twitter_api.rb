class TwitterApi
  def self.tweets(nickname)
    get_tweets(nickname).take(50)
  end

  def self.get_tweets(twittername)
    tweets = $client.user_timeline(twittername)
  end
end
