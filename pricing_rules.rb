class PricingRules

  @@products = {}


  def self.add_product(id, name, price)
    @@products[id] = {:name => name, :price => lambda { |id_list| price } }
  end


  def self.discount(id, qty, new_price)
    raise 'No product found' unless @@products[id]
    price = @@products[id][:price].call(nil)
    @@products[id][:price] = lambda do |id_list|
      id_list.select{ |s| s == id }.count >= qty ? new_price : price
    end
  end


  def self.buy_one_get_one_free(id)
    raise 'No product found' unless @@products[id]
    count = 0
    price = @@products[id][:price].call(nil)
    @@products[id][:price] = lambda do |id_list|
      count += 1
      count.odd? ? price : 0.0
    end
  end


  def get_prices(id_list)
    id_list.collect do |id|
      raise "No product found with id #{id}" unless @@products[id]
      @@products[id][:price].call(id_list)
    end
  end

end