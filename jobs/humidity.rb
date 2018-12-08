require 'net/https'
require 'json'
require 'uri'
require './common.rb'

url = "#{HOME_ASSISTANT_URL}/states/sensor.outdoor__humidity"
data = get_data url 
send_event('humidity', text: "#{data['state']} %", moreinfo: 'humidity')

SCHEDULER.every '10m' do
  data = get_data url
  send_event('humidity', text: "#{data['state']} %", moreinfo: 'humidity')
end
