class MasksController < ApplicationController
  def index
    @masks = Mask.all
    @stats = get_stats
  end

  private

  def get_stats
    date = Time.now
    url = URI("https://covid-19-data.p.rapidapi.com/report/country/name?date=2020-04-01&name=France")

    http = Net::HTTP.new(url.host, url.port)
    http.use_ssl = true
    http.verify_mode = OpenSSL::SSL::VERIFY_NONE

    request = Net::HTTP::Get.new(url)
    request["x-rapidapi-key"] = ENV['RAPIDAPI_KEY']
    request["x-rapidapi-host"] = ENV['RAPIDAPI_HOST']

    response = http.request(request)
    p response.read_body
  end
end
