# Command line interface
module UpdateProfilePic
  require 'update_profile_pic/config'
  require 'update_profile_pic/config_create'
  require 'update_profile_pic/update'
  require 'update_profile_pic/version'

  class << self
    OPTION_CREATE = '--create-config'
    OPTION_CONFIG = '--config'

    def usage
      puts "usage: \n"\
           "  #{PROJECT} <image file> #{OPTION_CONFIG} <config file> \n"\
           "  to create config file, type: #{PROJECT} #{OPTION_CREATE} \n"\
           "  more info → https://github.com/dkhamsing/update_profile_pic"
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

      if ARGV.include? OPTION_CONFIG
        position = ARGV.index OPTION_CONFIG
        cfgfile = ARGV[position+1]
      else
        puts 'error: missing --config options'
        usage
        exit
      end

      stripped_args = ARGV - [OPTION_CONFIG] - [cfgfile]
      file = stripped_args[0]
      unless File.exist? file
        puts "error: #{file} does not exist"
        exit
      end
      puts "updating profile pic with #{file} ..."

      c = config(cfgfile)
      t = c['twitter']
      if t.count == 0
        puts "error: could not load credentials from #{cfgfile}"
        exit
      end

      update_twitter(t, file) { |o| puts o }
    end # cli

  end # class
end
