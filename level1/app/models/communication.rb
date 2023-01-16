class Communication
  attr_accessor :id
  attr_reader :practitioner_id, :pages_number, :color, :sent_at

  def initialize(id, practitioner_id, pages_number, color, sent_at)
    @id = id
    @practitioner_id = practitioner_id
    @pages_number = pages_number
    @color = color || false
    @sent_at = sent_at
  end
end
