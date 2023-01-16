class Total
  attr_reader :sent_on, :total

  def initialize(attributes ={})
    @sent_on = attributes[:sent_on]
    @total = attributes[:total]
  end
end
