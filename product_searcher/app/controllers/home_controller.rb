require 'net/http'
class HomeController < ApplicationController
  before_action :authenticate_user!
  def search
    if params[:asin]
      url = URI.parse("http://localhost:3001/products/prices.json?asin=#{params[:asin]}")
      req = Net::HTTP::Get.new(url.to_s)
      begin
      res = Net::HTTP.start(url.host, url.port) {|http|
        http.request(req)
      }
      @result = JSON.parse(res.body)
      rescue => e
        flash[:alert] = "API is not started yet. Please search later."
        @result = []
      end
    else
      @result = []
    end
  end
end
