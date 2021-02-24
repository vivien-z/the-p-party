open "open-uri"

puts "destroying records..."

Booking.destroy_all
Theme.destroy_all
User.destroy_all

puts "start seeding..."

marjorie = User.create!(email: "marjorie@h.com" , password: "124456")
elenice = User.create!(email: "elenice@h.com" , password: "124456")
vivien = User.create!(email: "vivien@h.com" , password: "123456")
romuald = User.create!(email: "romuald@h.com" , password: "123456")
stephane = User.create!(email: "stephane@h.com" , password: "123456")

file = Uri.open(...)
unicorn = Theme.new(name: "Pinky unicorn", address: "295 Rue de la Montagne, Montreal", description: "Fantasy, dreamy and pink cloud.", price_cent: 12000, number_people: 10)
unicorn.user = marjorie
unicorn.photo.attach(io: file, filename: '', content_type: '')
unicorn.save!

cheesy_mango = Theme.new(name: "Cheesy Mango", address: "150 Rue Saint-Hubert, Montreal", description: "Fan of drinking cheesy mango drink at the beach?", price_cent: 15000, number_people: 10)
cheesy_mango.user = stephane
cheesy_mango.save!

alice = Theme.new(name: "Alice In Wonderland", address: "3220 avenue ridgewood montreal", description: "Magical and a running rabbit with his clock.", price_cent: 17000, number_people: 10)
unicorn.user = elenice
unicorn.save!

vikings = Theme.new(name: "Vikings", address: "493 Rue de Cherbourg, Longueuil", description: "Party hard like a Viking!", price_cent: 20000, number_people: 10)
unicorn.user = romuald
unicorn.save!

halloween = Theme.new(name: "Halloween", address: "222 curé-poirier, Laval", description: "Don't want to wait on october 31th? No problem.", price_cent: 10000, number_people: 10)
unicorn.user = vivien
unicorn.save!

booking_1 = Booking.new(starting_date: Date.today, ending_date: Date.today + 1)
booking_1.user = elenice
booking_1.theme = unicorn
booking_1.save!

booking_2 = Booking.new(starting_date: Date.today + 3, ending_date: Date.today + 4)
booking_2.user = romuald
booking_2.theme = halloween
booking_2.save!

booking_3 = Booking.new(starting_date: Date.today +10, ending_date: Date.today + 11)
booking_3.user = marjorie
booking_3.theme = alice
booking_3.save!

booking_4 = Booking.new(starting_date: Date.today + 2, ending_date: Date.today + 3)
booking_4.user = vivien
booking_4.theme = cheesy_mango
booking_4.save!

booking_5 = Booking.new(starting_date: Date.today, ending_date: Date.today + 5)
booking_5.user = stephane
booking_5.theme = vikings
booking_5.save!

puts "done seeding..."
