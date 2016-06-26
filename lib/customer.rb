class Customer
  attr_reader :name, :id
  
  @@customers = []
  @@id = 1
  
  def initialize(options={})
    @name = options[:name]
    @id = @@id
    @@id += 1
    add_to_customers
  end
  
  def self.all
    @@customers
  end
  
  def self.find_by_name(name)
    @@customers.find { |customer| customer.name == name }
  end

  def self.find(number)
    customer = @@customers.select { |customer| customer.id == number }
    customer[0]  
  end
  
  def purchase(product)
    Transaction.new(self, product)
  end

  
  private
  
  def add_to_customers   
    if @@customers.map { |customer| customer.name }.include? @name
      raise DuplicateCustomerError, "#{@name} already exists."
    else
      @@customers << self
    end
  end
end