class Practitioner
  attr_accessor :id, :first_name, :last_name, :express_delivery

  def initialize(id, first_name, last_name, express_delivery)
    @id = id
    @first_name = first_name
    @last_name = last_name
    @express_delivery = express_delivery || false
  end
end
