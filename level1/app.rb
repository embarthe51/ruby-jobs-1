require "json"
require_relative "app/models/practitioner"
require_relative "app/models/communication"
require_relative "app/models/total"
require_relative "app/controllers/totals_controller"
require 'time'

# Lecture et parsing du fichier data.json
data = File.read('data.json')
parsed_data = JSON.parse(data)

@practitioners = []
parsed_data['practitioners'].each do |item|
  @practitioner = Practitioner.new(item['id'], item['first_name'], item['last_name'], item['express_delivery'])
  @practitioners << @practitioner
end

@communications = []
parsed_data['communications'].each do |item|
  @practitioner = @practitioners.find { |p| p.id == item['practitioner_id'] }
  @communication = Communication.new(item['id'], item['practitioner_id'], item['pages_number'], item['color'], Time.parse(item['sent_at']), @practitioner)
  @communications << @communication
end

totals_controller = TotalsController.new(@communications, @practitioners)
totals = totals_controller.calculates_prices

File.write('output.json', { totals: totals }.to_json)
