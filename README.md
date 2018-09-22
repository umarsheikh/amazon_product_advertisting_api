# amazon_product_advertisting_api
amazon product advertising api

Test Project: Part I

Using the Amazon Product Advertising API, build a simple Rails API that looks up product data and returns it as JSON. You should have two endpoints:

GET /products/prices - Takes one param, “asin” and returns a json representation of: 

1) the asin

2) the current lowest used price on amazon

3) the current new price on amazon

4) the difference between the current used price and the trade in value, if it exists (you will need to read the docs to figure out how to access trade in prices). If no trade in price exists, return nil. Feel free to fake this value in your tests if needed.

An example request to this endpoint would look like: 

    curl http://localhost:3000/products?asin=0973778709

And an example response might look like:

    {“asin”: “0973778709”, “used_price”: 1245, “new_price”: 875, “trade_in_profit”: nil}

GET /products/popular - Returns a json representation of your api’s top 3 most searched asins, along with the number of times they’ve been searched for, in descending order. For example, if you request the asin “0973778709” from /products/prices 4 times and “1593279507” 2 times, the response from this endpoint should look something like:

{“0973778709”: 4, “1593279507”: 2}

Feel free to stop here or make this as complex as you’d like. Your app should have at least basic test cases for both endpoints.

If you have any questions about the way responses should be formatted or how to represent price data, just follow your own instinct.

Your API credentials are:

AWS_ACCESS_KEY_ID=[]

AWS_SECRET_ACCESS_KEY=[]

AWS_ASSOCIATE_TAG=[]

Notes:

 - There’s a ruby gem wrapper for the PA API called Vacuum (https://github.com/hakanensari/vacuum)

 - The PA API operation you’re interested in is called ItemLookup, and it has a matching method in the vacuum gem. Product data is nested inside the [‘ItemLookupResponse’][‘Items’][‘Item’] hash in this response.

Bonus:

Your API suddenly becomes very popular and you begin getting throttled by amazon. You’re given 2 more API keys - how might you distribute the load across them instead of relying on a single one?

Test Project: Part II

Build a client app to consume the API you just made. You can use a modern javascript framework, jquery, or just consume it on the backend and do regular MVC. The requirements are:

- Must have basic user authentication (feel free to use Devise)
- Must have an account page where the user can see their email and sign up date
- Must have a search box where you can enter an ASIN and then display the results

Bonus:

- Expand your api to take a list of multiple asins and prefetch a list of 10 prices on page load
- Add a “refer a friend” feature. Authenticated users would have a unique link on their account pages that they could share with others - when someone signs up with that link, their name would show up under a “referrals” header on the referring users account page.

