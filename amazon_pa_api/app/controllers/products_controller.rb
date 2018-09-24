class ProductsController < ApplicationController
  before_action :setup_request
  def prices
    asin = params[:asin]
    ProductSearch.find_or_create_by(asin: asin).increment!
    @response = @request.item_lookup(
      query: {
        'ItemId' => asin,
        'ResponseGroup' => 'OfferFull'
      }
    )
    @json_response = Hash.from_xml(@response.data[:body])
    @lowest_new_price = @json_response['ItemLookupResponse']['Items']["Item"]["OfferSummary"]["LowestNewPrice"]["FormattedPrice"] rescue ""
    @lowest_used_price = @json_response['ItemLookupResponse']['Items']["Item"]["OfferSummary"]["LowestUsedPrice"]["FormattedPrice"] rescue ""
    @hash = {asin: asin, used_price: @lowest_used_price, new_price: @lowest_new_price, trade_in_profit: nil}
    render json: @hash
  end
  def popular
    @product_searches = ProductSearch.order("counter desc").limit(3)
    render json: @product_searches, only: ['asin', 'counter']
  end
  
  private
  def setup_request
    @request = Vacuum.new
    @request.configure(
      aws_access_key_id: AWS_ACCESS_KEY_ID,
      aws_secret_access_key: AWS_SECRET_ACCESS_KEY,
      associate_tag: AWS_ASSOCIATE_TAG
  )
  end
end

  #@request.version = "2013-08-01"
  #@request.version = "2010-11-01"

