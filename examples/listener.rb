require 'redis'
require 'json'

$redis = Redis.new(:timeout => 0)

$redis.subscribe('exceptions') do |on|
  on.message do |channel, msg|
    data = JSON.parse(msg)
    puts "##{channel} - #{data['exception']['class']}} -> #{data['exception']['message']}"
  end
end
