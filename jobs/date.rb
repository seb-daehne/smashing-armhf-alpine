# Populate the graph with some random points

time = Time.now
date = "#{time.strftime("%a")} - #{time.day}.#{time.month}.#{time.year}"
send_event('date', text: date)

SCHEDULER.every '1h' do
  time = Time.now
  date = "#{time.strftime("%a")} - #{time.day}.#{time.month}.#{time.year}"
  send_event('date', text: date)
end