class Product
  attr_reader :title
  
  @@products = []

  def initialize(options={})
    @title = options[:title]
#    @price = options[:price]
#    @stock = options[:stock]
    add_to_products
  end

  def self.all
    @@products
  end
  
#  def find_by_title
#  end

  private
  
  def add_to_products   
    if @@products.map { |product| product.title }.include? @title
     raise DuplicateProductError, "#{@title} already exists."
    else
      @@products << self
    end
  end
end