require_relative 'pricing_rules.rb'

class Product < PricingRules

  add_product :FR1, 'Fruit tea', 3.11
  add_product :SR1, 'Strawberries', 5.0
  add_product :CF1, 'Coffee', 11.23

  buy_one_get_one_free :FR1
  discount :SR1, 3, 4.5

end