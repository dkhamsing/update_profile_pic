# Create config
module UpdateProfilePic
  require 'twitter_oauth_token'
  require 'yaml'

  UPP_CONSUMER_KEY = 'tea3QOP0tgwdXN8OAsXjJckM9'
  UPP_CONSUMER_SECRET = '2qhlzrLSNyAfZgRs7FN0yuPeX9CEfFYren03RmqCc0CbWUhI6n'

  class << self
    def config_create
      c = TwitterOAuthToken::consumer(UPP_CONSUMER_KEY, UPP_CONSUMER_SECRET)
      request_token = TwitterOAuthToken::request_token(c)
      url = TwitterOAuthToken::authorize_url(request_token)

      puts "open this url in your browser (sign in and authorize): #{url}"

      print "enter pin: "
      pin = STDIN.gets.strip

      begin
        access_token = TwitterOAuthToken::access_token(request_token, pin)
      rescue => e
        puts "error: #{e}"
        exit
      end

      config = [
          'twitter' => {
            CONSUMER_KEY.downcase => UPP_CONSUMER_KEY,
            CONSUMER_SECRET.downcase => UPP_CONSUMER_SECRET,
            ACCESS_TOKEN.downcase => access_token.token,
            ACCESS_TOKEN_SECRET.downcase => access_token.secret
          }
      ]

      File.open(CONFIG, 'w') { |f| f.write config.to_yaml }
      puts "wrote #{CONFIG} ✨"
    end
  end # class
end
