require 'test/unit'
require_relative 'lib/checkout.rb'
require_relative 'lib/product.rb'

class TestReevoo < Test::Unit::TestCase

  def setup
    @co = Checkout.new(Product.new)
  end

  def test_data1
    %w(FR1 SR1 FR1 CF1).each{ |id| @co.scan(id.to_sym) }
    assert_equal(22.25, @co.total)
  end

  def test_data2
    %w(FR1 FR1).each{ |id| @co.scan(id.to_sym) }
    assert_equal(3.11, @co.total)
  end

  def test_data3
    %w(SR1 SR1 FR1 SR1).each{ |id| @co.scan(id.to_sym) }
    assert_equal(16.61, @co.total)
  end


end