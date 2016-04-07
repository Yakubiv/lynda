module Kursach
  class TweetsController < ApplicationController
    def index
    end

    def create
      create_tweets

      redirect_to kursach_tweets_path, notice: 'Tweets have added to your datebase'
    end

    private

    def create_tweets
      tweets.each do |tweet|
        Tweet.create(tweet_params(tweet))
      end
    end

    def tweet_params(tweet)
      {
        text: tweet.text,
        created_at: tweet.created_at,
        owner_id: user.id,
        origin_id: tweet.id,
        favorites_count: tweet.favorites_count
      }
    end

    def user
      TwitterUser.includes(:tweets).find_by(nickname: params[:nickname] || 'PYakubiv')
    end
    helper_method :user

    def tweets
      @tweets = if user.tweets.any?
        user.tweets
      else
        TwitterApi.tweets(params[:nickname] || 'PYakubiv')
      end
    end
    helper_method :tweets
  end
end
