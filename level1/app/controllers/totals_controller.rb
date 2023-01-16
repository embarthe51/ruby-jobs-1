require_relative "../models/total"

class TotalsController
  def initialize(communication, practitioner)
    @practitioner = practitioner
    @communication = communication
  end
end
