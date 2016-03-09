# Configuration
module UpdateProfilePic
  require 'yaml'

  class << self
    TWITTER_KEY = 'twitter'

    def config(file)
      f = File.read(file)
      c = YAML.load(f)

      twitter = []
      c.each do |h|
        h.each do |key, value|
          if key == TWITTER_KEY
            twitter.push value
          end
        end
      end

      c.each do |key, value|
        twitter.push value if key == TWITTER_KEY
      end

      { TWITTER_KEY => twitter }
    end # config
  end # class
end
