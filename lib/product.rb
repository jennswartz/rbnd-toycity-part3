class Product
  attr_reader :title, :price, :stock
  
  @@products = []

  def initialize(options={})
    @title = options[:title]
    @price = options[:price]
    @stock = options[:stock]
    add_to_products
  end

  def self.all
    @@products
  end
  
  def self.find_by_title(name)
    @@products.find { |product| product.title == name }
  end

  def in_stock?
    @stock > 0  
  end
  
  def self.in_stock
    @@products.select { |product| product.stock > 0 }   
  end
  
  private
  
  def add_to_products   
    if @@products.map { |product| product.title }.include? @title
      raise DuplicateProductError, "#{@title} already exists."
    else
      @@products << self
    end
  end
end