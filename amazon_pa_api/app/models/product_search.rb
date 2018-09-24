class ProductSearch < ApplicationRecord

  def increment!
    self.counter = self.counter.to_i
    self.counter += 1
    save!
  end
end
