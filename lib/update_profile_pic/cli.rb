# Command line interface
module UpdateProfilePic
  require 'update_profile_pic/config'
  require 'update_profile_pic/config_create'
  require 'update_profile_pic/update'
  require 'update_profile_pic/version'

  class << self
    OPTION_CREATE = '--create-config'

    def usage
      puts "usage: #{PROJECT} <image file>"
    end

    def cli
      puts "#{PROJECT} #{VERSION}"

      if ARGV.count == 0
        usage
        exit
      end

      if ARGV.include? OPTION_CREATE
        config_create
        exit
      end

      unless File.exist? CONFIG
        puts "missing config.yml, to create one, type: #{PROJECT} #{OPTION_CREATE}"
        puts 'more info → https://github.com/dkhamsing/update_profile_pic'
        exit
      end

      c = config(CONFIG)

      file = ARGV[0]
      unless File.exist? file
        puts "error: #{file} does not exist"
        exit
      end
      puts "updating profile pic with #{file} ..."

      t = c['twitter']
      if t.count == 0
        puts "error: could not load credentials from #{CONFIG}"
        exit
      end

      update_twitter(t, file) { |o| puts o }
    end # cli

  end # class
end
