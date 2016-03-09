require 'update_profile_pic'

LOG_FILE = 'log.txt'

def log(s)
  File.open(LOG_FILE, 'a') { |f| f.puts s }
  puts s
end

log 'update profile pic test'

log 'configuring ...'

c1 = UpdateProfilePic::CONSUMER_KEY
c2 = UpdateProfilePic::CONSUMER_SECRET
a1 = UpdateProfilePic::ACCESS_TOKEN
a2 = UpdateProfilePic::ACCESS_TOKEN_SECRET

c = {
  c1.downcase => ENV[c1],
  c2.downcase => ENV[c2],
  a1.downcase => ENV[a1],
  a2.downcase => ENV[a2]
}

f = Dir.glob "test/assets/*"
file = f.sample
log "test profile with image: #{file}"

UpdateProfilePic::update_twitter([c], file) do |o|
  exit 1 if o.include? 'error'
  log 'profile updated ✅' if o.include? 'updated'
end

puts 'artifacts: getting image ...'
image = 'image.png'
u = ENV['USERNAME']
url = "https://twitter.com/#{u}/profile_image?size=mini"
`wget --quiet --output-document=#{image} #{url}`
puts '✅'
