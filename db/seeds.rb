require "open-uri"

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

file = URI.open("https://www.sandyalamode.com/wp-content/uploads/2017/09/SLPF-1-800x534.jpg")
unicorn = Theme.new(name: "Pinky unicorn", address: "295 Rue de la Montagne, Montreal", description: "Fantasy, dreamy and pink cloud.", price_cent: 120, number_people: 10)
unicorn.user = marjorie
unicorn.photos.attach(io: file, filename: 'unicorn.jpg', content_type: 'image/jpg')
unicorn.save!

file = URI.open("https://links.imagerelay.com/cdn/34/ql/494f11d15454499bbd82a1521ef30766/Cheddar_Island_950x772_72_RGB.jpg")
cheesy_mango = Theme.new(name: "Cheesy Mango", address: "150 Rue Saint-Hubert, Montreal", description: "Fan of drinking cheesy mango drink, at the beach?", price_cent: 150, number_people: 10)
cheesy_mango.user = stephane
cheesy_mango.photos.attach(io: file, filename: 'mango.jpg', content_type: 'image/jpg')
cheesy_mango.save!

file = URI.open("https://karaspartyideas.com/wp-content/uploads/2019/08/Alice-in-Wonderland-Tea-Party-via-Karas-Party-Ideas-KarasPartyIdeas.com9_.jpg")
alice = Theme.new(name: "Alice In Wonderland", address: "3220 avenue ridgewood montreal", description: "Magical and a running rabbit with his clock.", price_cent: 170, number_people: 10)
alice.user = elenice
alice.photos.attach(io: file, filename: 'alice.jpg', content_type: 'image/jpg')
alice.save!

file = URI.open("https://s3.amazonaws.com/files.gofox.com/wp-content/uploads/2015/08/hurt-4.jpg")
vikings = Theme.new(name: "Vikings", address: "493 Rue de Cherbourg, Longueuil", description: "Party hard like a Viking!", price_cent: 200, number_people: 10)
vikings.user = romuald
vikings.photos.attach(io: file, filename: 'vikings.jpg', content_type: 'image/jpg')
vikings.save!

file = URI.open("https://photos-cdn.catchmyparty.com/BL/2018/10/skull.jpg")
halloween = Theme.new(name: "Halloween", address: "222 curé-poirier, Laval", description: "Don't want to wait on october 31th? No problem.", price_cent: 100, number_people: 10)
halloween.user = vivien
halloween.photos.attach(io: file, filename: 'halloween.jpg', content_type: 'image/jpg')
halloween.save!

#CREATING BOOKING
booking_1 = Booking.new(starting_date: Date.today, ending_date: Date.today + 1)
booking_1.user = elenice
booking_1.theme = unicorn
booking_1.save!

booking_2 = Booking.new(starting_date: Date.today + 3, ending_date: Date.today + 4)
booking_2.user = romuald
booking_2.theme = halloween
booking_2.save!

booking_3 = Booking.new(starting_date: Date.today + 10, ending_date: Date.today + 11)
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
