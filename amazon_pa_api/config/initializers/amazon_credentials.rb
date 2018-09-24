data = YAML.load(File.read(Rails.root.to_s + "/config/amazon_credentials.yml"))
AWS_ACCESS_KEY_ID = data[Rails.env]["AWS_ACCESS_KEY_ID"]
AWS_SECRET_ACCESS_KEY = data[Rails.env]["AWS_SECRET_ACCESS_KEY"]
AWS_ASSOCIATE_TAG = data[Rails.env]["AWS_ASSOCIATE_TAG"]
