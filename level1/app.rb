require "json"
require_relative "app/models/practitioner"
require_relative "app/models/communication"
require_relative "app/models/total"

# Lecture et parsing du fichier data.json
data = File.read('data.json')
parsed_data = JSON.parse(data)

# Initialisation des instances de la classe Practitioner à partir des données contenues dans parsed_data
parsed_data.each do |item|
  puts @practitioner = Practitioner.new(item[:id], item['color'], item['sent_at'])
end

@communications.each do |communication|
  @total.sent_on = communication.sent_at
  @total.total = 0.10
  num_page = communication.pages - 1
  @total.total += num_page * 0.07
  if communication.color == true
    @total.total += 0.18
  end
  if communication.practitioner.express_delivery == true
    @total.total += 0.60
  end
end
