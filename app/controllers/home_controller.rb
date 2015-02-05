class HomeController < ApplicationController
  def index
	  http = Keen.publish_async(:customers, { first_name: "lox", :referred_by => "harry" })
		http.callback { |response| puts "Success: #{response}"}
		http.errback { puts "was a failurrr :,(" }
  end
end
