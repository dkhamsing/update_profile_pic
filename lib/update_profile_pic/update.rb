# Update profile
module UpdateProfilePic
  require 'update_profile_pic/twitter'

  class << self
    def update_twitter(twitter, file)
      twitter.each do |t|
        begin
          client = twitter_client(t)
          yield "updating @#{twitter_username(client)} ..." if block_given?

          twitter_update(client, file) { |o| yield o if block_given? }
        rescue => e
          yield "client error: #{e}" if block_given?
          next
        end
      end # twitter.each
    end # def
  end # class
end
