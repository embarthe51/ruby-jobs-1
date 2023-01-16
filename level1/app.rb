require "json"
require_relative "app/models/practitioner"
require_relative "app/models/communication"
require_relative "app/models/total"
require_relative "app/controllers/communications_controller"
require_relative "app/controllers/totals_controller"

# Lecture et parsing du fichier data.json
data = File.read('data.json')
parsed_data = JSON.parse(data)

# Initialisation des instances de la classe Practitioner à partir des données contenues dans parsed_data
@practitioners = []
parsed_data['practitioners'].each do |item|
  @practitioner = Practitioner.new(item['id'], item['first_name'], item['last_name'], item['express_delivery'])
  @practitioners << @practitioner
end

@communications = []
parsed_data['communications'].each do |item|
  @communication = Communication.new(item['id'], item['practitioner_id'], item['pages_number'], item['color'], item['sent_at'])
  @communications << @communication
end

puts @practitioner.id

@communications.each do |c|
  id = c.practitioner_id
  puts @practitioner[id]
end



@totals = []
@communications.each do |communication|
  sent_on = communication.sent_at
  puts sent_on
  # il faudra ensuite faire un groupe by par date
  sum = 0.10
  num_page = communication.pages_number - 1
  sum += num_page * 0.07
  if communication.color == true
    sum += 0.18
  end
  puts sum
  # le block ne fonctionne pas, il faut retravailler
  @practitioner[communication.practitioner_id].each do |e|
    if e.express_delivery == true
      sum += 0.60
    end
  end
  # fonctionne pas non plus
  @total = Total.new(sent_on: sent_on, total: sum)
  @totals << @total
end
# faire le groupe by comme expliaue plus haut
@totals.each do |total|
  puts total.sent_on
end
