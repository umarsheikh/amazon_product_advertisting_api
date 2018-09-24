require 'net/http'
class HomeController < ApplicationController
  before_action :authenticate_user!
  def search
    url = URI.parse("http://localhost:3001/products/prices.json?asin=#{params[:asin]}")
    req = Net::HTTP::Get.new(url.to_s)
    res = Net::HTTP.start(url.host, url.port) {|http|
      http.request(req)
    }
    @result = JSON.parse(res.body)
  end
end
