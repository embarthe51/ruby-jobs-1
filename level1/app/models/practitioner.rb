class Practitioner
  attr_accessor :id
  attr_reader :first_name, :last_name, :express_delivery

  def initialize(attributes ={})
    @id = attributes[:id]
    @first_name = attributes[:first_name]
    @last_name = attributes[:last_name]
    @express_delivery = attributes[:express_delivery] || false
  end
end
