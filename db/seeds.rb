puts "destroying records..."

Booking.destroy_all
Theme.destroy_all
User.destroy_all

puts "start seeding..."

marjorie = User.create!(email: "marjorie@h.com" , password: "123456")
elenice = User.create!(email: "elenice@h.com" , password: "123456")
vivien = User.create!(email: "vivien@h.com" , password: "123456")
romuald = User.create!(email: "romuald@h.com" , password: "123456")
stephane = User.create!(email: "stephane@h.com" , password: "123456")


unicorn = Theme.new(name: "Pinky unicorn", description: "Fantasy, dreamy and pink cloud.", price_cent: 12000, number_people: 10)
unicorn.user = marjorie
unicorn.save!

cheesy_mango = Theme.new(name: "Cheesy Mango", description: "Fan of drinking cheesy mango drink at the beach?", price_cent: 15000, number_people: 8)
cheesy_mango.user = stephane
cheesy_mango.save!

unicorn = Theme.new(name: "Alice In Wonderland", description: "Magical and a running rabbit with his clock.", price_cent: 17000, number_people: 10)
unicorn.user = elenice
unicorn.save!

unicorn = Theme.new(name: "Vikings", description: "Party hard like a Viking!", price_cent: 20000, number_people: 10)
unicorn.user = romuald
unicorn.save!

unicorn = Theme.new(name: "Halloween", description: "Don't want to wait on october 31th? No problem.", price_cent: 10000, number_people: 10)
unicorn.user = vivien
unicorn.save!

booking_1 = Booking.new(starting_date: Date.today, ending_date: Date.today + 1)
booking_1.user = elenice
booking_1.theme = unicorn
booking_1.save!

booking_2 = Booking.new(starting_date: Date.today + 3, ending_date: Date.today + 4)
booking_2.user = romuald
booking_2.theme = unicorn
booking_2.save!

puts "done seeding..."
