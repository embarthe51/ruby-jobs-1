require_relative "../models/communication"

class CommunicationsController
  def initialize(communications)
    @communications = Communication.all
  end
end
