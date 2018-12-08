require_relative './jobs/common.rb'

url = "#{$HOME_ASSISTANT_URL}/states/sensor.weather_temperature"
data = get_data url
send_event('forecast', text: "#{data['state']} °C", moreinfo: 'temp forecast 4h')

SCHEDULER.every '10m' do
  data = get_data url
  send_event('forecast', text: "#{data['state']} °C", moreinfo: 'temp forecast 4h')
end
