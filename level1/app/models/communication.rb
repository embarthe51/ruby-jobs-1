class Communication
  attr_accessor :id, :practitioner_id, :pages_number, :color, :sent_at, :practitioner

  def initialize(id, practitioner_id, pages_number, color, sent_at, practitioner)
    @id = id
    @practitioner_id = practitioner_id
    @pages_number = pages_number
    @color = color || false
    @sent_at = sent_at
    @practitioner = practitioner
  end

  def express_delivery
    @practitioner = @practitioners.find { |p| p.id == practitioner_id }
    @practitioner.express_delivery
  end
end
