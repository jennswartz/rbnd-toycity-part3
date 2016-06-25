class Transaction

  @@transactions = []
  @@id = 1

  attr_reader :customer, :product, :id

  def initialize(customer, product)
    @customer = customer
    @product = product
    @id = @@id
    @@id += 1
    add_to_transactions
  end
    
  def self.all
    @@transactions
  end
  
  def self.find(number)
    transaction = @@transactions.select { |transaction| transaction.id == number }
    transaction[0]  
  end
  
  private
  
  def add_to_transactions
    if @product.stock <= 0
      raise OutOfStockError, "#{@product.title} is out of stock."
    elsif
      @product.stock -= 1
      @@transactions << self
    end
  end
  
end