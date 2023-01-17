require_relative '../models/total'

class TotalsController
  def initialize(communications, practitioners)
    @communications = communications
    @practitioners = practitioners
  end

  def calculates_prices
    @totals = []
    grouped_communications = @communications.group_by do |communication|
      communication.sent_at.to_date
    end
    grouped_communications.each do |sent_on, communications|
      total = 0
      communications.each do |c|
        total += 0.1
        total += 0.18 if c.color == true
        total += 0.60 if c.practitioner.express_delivery == true
        total += (c.pages_number - 1) * 0.07
      end
      @totals << { sent_on: sent_on, total: total }
    end
    @totals
  end
end
