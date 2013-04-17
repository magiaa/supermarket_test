class Checkout

  def initialize(pricing_rules)
    @pricing_rules = pricing_rules
    @basket = []
  end

  def scan(item)
    @basket << item
  end

  def total
    @pricing_rules.get_prices(@basket).inject(:+)
  end

end