# Update Twitter profile picture
module UpdateProfilePic
  require 'twitter'

  class << self
    def twitter_client(t)
      Twitter::REST::Client.new do |config|
        config.consumer_key        = t['consumer_key']
        config.consumer_secret     = t['consumer_secret']
        config.access_token        = t['access_token']
        config.access_token_secret = t['access_token_secret']
      end
    end

    def twitter_update(client, file)
      begin
        image = File.new(file)
        client.update_profile_image image
        yield "profile pic updated ✨" if block_given?
      rescue => e
        yield "update error: #{e}" if block_given?
      end
    end

    def twitter_username(client)
      client.user.screen_name
    end
  end # class
end
