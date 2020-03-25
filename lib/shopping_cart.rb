class ShoppingCart
  attr_reader :name,
              :capacity,
              :products,
              :details
  def initialize(name, capacity)
    @name = name
    @capacity = capacity.to_i
    @products = []
    @details = {}
  end

  def add_product(product)
    @products << product
  end

  def total_number_of_products
    @products.reduce(0) do |total, product|
      total += product.quantity
    end
  end

  def is_full?
    total_number_of_products >= @capacity
  end

  def products_by_category(category)
    @products.find_all do |product|
      product.category == category
    end
  end

  def generate_details
    @details[:name] = @name
    @details[:capacity] = @capacity
  end

end
