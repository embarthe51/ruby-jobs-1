class Communication
  attr_accessor :id
  attr_reader :practitioner_id, :pages_number, :color, :sent_at

  def initialize(attributes = {})
    @id = attributes[:id]
    @practitioner_id = attributes[:practitioner_id]
    @pages_number = attributes[:pages_number]
    @color = attributes[:color] || false
    @sent_at = attributes[:sent_at]
  end
end
