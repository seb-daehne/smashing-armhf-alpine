
SCHEDULER.every '10s' do
  time = Time.now
  time_string = time.strftime("%H:%M")
  send_event('time', { time: time_string })
end