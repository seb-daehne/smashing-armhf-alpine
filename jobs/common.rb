require 'net/https'
require 'json'
require 'uri'

$HA_URL = ENV["HOME_ASSISTANT_URL"]
$HA_SECRET = ENV["HOME_ASSISTANT_SECRET"]

def get_data(url)
    uri = URI.parse(url)
    http = Net::HTTP.new(uri.host, uri.port)
    http.use_ssl = true
    request = Net::HTTP::Get.new(uri.request_uri, { "Accept-Encoding" => "none"})
    request.add_field("x-ha-access", $HOME_ASSISTANT_SECRET)
    data = JSON.parse(http.request(request).body)
end