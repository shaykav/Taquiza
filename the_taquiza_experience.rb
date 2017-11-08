taquiza_menu = {
	:name => "Taquiza",
	:sections => [
		{
			:name => "Tacos",
			:description => "Freshly made blue corn tortillas",
			:items => [
						{
							:name => "Al Pastor",
							:description => "pork, achiote, pineapple",
							:price => "3.50"
						},
						{
							:name => "Chorizo",
							:description => "pork, paprika, cumin, garlic",
							:price => "3.50"
						},
						{
							:name => "Barbacoa",
							:description => "beef, cumin, pasilla, negra",
							:price => "3.50"
						},
						{
							:name => "Pollo",
							:description => "chicken, scallion, cilantro",
							:price => "3.50"
						},
						{
							:name => "Huitlacoche",
							:description => "corn 'truffle', corn, scallion",
							:price => "3.50"
						},
						{
							:name => "Carnitas",
							:description => "pork, orange, cinnamon",
							:price => "3.50"
						},
						{
							:name => "Asada",
							:description => "steak, citrus, chile de arbol",
							:price => "5.00"
						},
						{
							:name => "Lengua",
							:description => "beef tongue, cerveza victoria",
							:price => "3.50"
						},
						{
							:name => "Camaron",
							:description => "shrimp, red 'mole', slaw",
							:price => "5.00"
						},
						{
							:name => "Rajas",
							:description => "poblano, onion, crema, cotija",
							:price => "3.50"
						},
						{
							:name => "Chapulines",
							:description => "grasshoppers, avocado, tajin",
							:price => "3.50"
						}
					]
		},
		{
			:name => "Sides / Antojitos",
			:items => [
						{
							:name => "Totopos",
							:description => "hand torn blue masa chips",
							:price => "5.00",
							:extras => [
								{
									:name => "guac",
									:price => "2.00"
								},
								{
									:name => "frijoles",
									:price => "2.00"
								},
								{
									:name => "salsa",
									:price => "1.50"
								}
							]
						},
						{
							:name => "Elote",
							:description => "charred corn, cilantro-jalepeno crema, cotija",
							:price => "5.00"
						},
						{
							:name => "Quinoa",
							:description => "jicama, scallion, chile, nopal dressing",
							:price => "6.50"
						}
					]
		},
		{
			:name => "Beer/Cerveza",
			:items => [
						{
							:name => "Corono Extra",
							:price => "7.00"
						},
						{
							:name => "Corona Light",
							:price => "6.00"
						},
						{
							:name => "Negra Modelo",
							:price => "6.00"
						},
						{
							:name => "Pacifico",
							:price => "6.00"
						},
						{
							:name => "Tecate",
							:price => "5.00"
						},
						{
							:name => "Victoria",
							:price => "6.00"
						},
						{
							:name => "Rotating Craft Selection",
							:price => "8.00"
						}
					]
		},
		{
			:name => "Breakfast",
			:description => "Everyday 8 am - 11:30 am",
			:items => [
						{
							:name => "Huevos A La Mexicana",
							:description => "scrambled eggs, pico, frijoles, crema, tortillas",
							:price => "5"
						},
						{
							:name => "Quesadillas De Epazote",
							:description => "queso chihuahua, cotija, epazote, pico, frijoles",
							:price => "5"
						},
						{
							:name => "Tostada De Aquacate",
							:description => "avocado, egg, frijoles, cabbage, cotija",
							:price => "6"
						},
						{
							:name => "Chilaquiles",
							:description => "crispy masa, pollo, salsa roja, eggs, crema",
							:price => "6"
						},
						{
							:name => "Tortilla De Aguacate",
							:description => "avocado, queso chihuahua, cotija, frijoles",
							:price => "6"
						}
					]
		},
		{
			:name => "Coffee & Tea",
			:items => [
						{
							:name => "Expresso",
							:type => [
								{
									:name => "shot",
									:price => "3"
								},
								{
									:name => "cortado",
									:price => "4"
								},
								{
									:name => "latte",
									:price => "5"
								}
							]
						},
						{
							:name => "La Endulzada",
							:description => "expresso, condensed milk, ice, shaken",
							:price => "5"
						},
						{
							:name => "Green Tea",
							:description => "Jasmine Cloud by Jojo Tea",
							:price => "3"
						},
						{
							:name => "Orange Juice",
							:description => "Freshly Squeezed Florida OJ",
							:price => "5"
						}
					]
		}
	]

}





def show_menu(menu)

	menu[:sections].each do |section|
		puts section[:name]
		puts section[:description]
		section[:items].each do |item|
			puts item[:name]
			puts item[:description]
			puts item[:price]

			item[:extras] = item[:extras] || []

			item[:extras].each do |extra|
				puts extra[:name]
				puts extra[:price]
			end

			item[:type] = item[:type] || []

			item[:type].each do |type|
				puts type[:name]
				puts type[:price]

			end
			puts " "
		end
	end

end



def place_order(menu, cart)

	loop do
		puts "What would you like to add to your order? Enter 'done ordering' when finished"


		order = gets.chomp.downcase

		break if order == "done ordering"


		menu[:sections].each do |section|
			section[:items].each do |item|
				if order == item[:name].downcase
					cart << item

					item[:extras] = item[:extras] || []

					if item[:extras].any?
						puts "Did you want to add any extras?"
						add = gets.chomp.downcase
						item[:extras].each do |extra|
							cart << extra if add == extra[:name].downcase
						end
					end

					item[:type] = item[:type] || []

					if item[:type].any?
						puts "What type?"
						item_type = gets.chomp.downcase
						item[:type].each do |type|
							cart << type if item_type == type[:name].downcase
						end
					end
				end
			end
		end


	end

	cart

end



def get_check(cart)

	sub_total = 0
	cart.each do |item|
		sub_total = sub_total + item[:price].to_f
	end

	tax = ("%.2f") % (sub_total * 0.06)

	tip_15 = ("%.2f") % (sub_total * 0.15)
	tip_18 = ("%.2f") % (sub_total * 0.18)
	tip_20 = ("%.2f") % (sub_total * 0.20)

	puts "________"

	cart.each do |item|
		puts item[:name]
	end

	puts "Subtotal: " + ("%.2f") % sub_total
	puts "Tax: " + tax
	puts "Gratuity Suggestions"
	puts "15% - #{tip_15}"
	puts "18% - #{tip_18}"
	puts "20% - #{tip_20}"
	puts "________"

end





taquiza_cart = Array.new




puts "Welcome to Taquiza!"

loop do
	sleep 1
	puts "Please select one of the following options: show menu, place order, done ordering, get the check"
	answer = gets.chomp
	if answer == "show menu"
		show_menu(taquiza_menu)
	elsif answer == "place order"
		taquiza_cart = place_order(taquiza_menu, taquiza_cart)
	elsif answer == "get the check"
		get_check(taquiza_cart)
		break
	end
	break if answer == "done ordering"
end










# sleep 2
#
#
# loop do
# 	puts "Would you like to place an order? (Enter: place order)"
# 	answer1 = gets.chomp
# 	break if answer1 == "place order"
# end
#
#
# array_order = Array.new
# puts "What would you like to order?"
#
# while user_input = gets.chomp
# 	if show_menu.include?(user_input)
# 		array_order << gets.chomp
# 	else
# 		puts "Invalid response"
# 		loop do
# 		puts "Please make a selection from our menu"
# 		selection = gets.chomp
# 			if show_menu.include?(selection)
# 				array_order << gets.chomp
# 				break
# 			end
# 		end
# 	end
# end
#
# puts "Does that complete your order? Please enter 'done ordering' or 'continue ordering'"
# answer2 = gets.chomp
# case answer2
# when "done ordering"
# 	puts "Would you like the check? Please enter 'get the check'"
# 	answer3 = gets.chomp
# when "continue ordering"
# 	loop do
# 	puts "What would you like to add?"
# 	selection1 = gets.chomp
# 		if show_menu.include?(selection)
# 			array_order << gets.chomp
# 			break
# 		end
# 	end
# else
# 	puts "Invalid response"
# end
#
#
#
# if answer3 == "get the check"
#
# puts array_order
#
#
# #
# #
# #
# #
# #
# #
# #
# #
# #
# #
