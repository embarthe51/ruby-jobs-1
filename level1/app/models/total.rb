class Total
  attr_accessor :sent_on, :total

  def initialize(sent_on, total)
    @sent_on = sent_on
    @total = total
  end
end
