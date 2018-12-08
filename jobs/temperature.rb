require_relative './jobs/common.rb'

url = "#{HOME_ASSISTANT_URL}/states/sensor.outdoor__temperature"
data = get_data url
send_event('temperature', text: "#{data['state']} °C", moreinfo: 'temp outdoor')

SCHEDULER.every '10m' do
  data = get_data url
  send_event('temperature', text: "#{data['state']} °C", moreinfo: 'temp outdoor')
end
