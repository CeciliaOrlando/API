user = User.find_or_initialize_by(email: "cecilia@gmail.com")
user.password = "123456"
user.password_confirmation = "123456"

restaurant = user.restaurants.find_or_initialize_by(name: "La Tour d \'Argent", address: "15 Quai de la Tournelle, 75005 Paris")
restaurant2 = user.restaurants.find_or_initialize_by(name: "Le Jules Verne", address: "Avenue Gustave Eiffel, 75007 Paris")
restaurant3 = user.restaurants.find_or_initialize_by(name: "Le Cinq", address: "31 Avenue George V, 75008 Paris")

user.save



user2 = User.find_or_initialize_by(email: "emanuel@gmail.com")
user2.password = "123456"
user2.password_confirmation = "123456"

restaurant = user2.restaurants.find_or_initialize_by(name: "Le Joaqui de ", address: "Avenue Gustave Eiffel, 75007 Paris")

user2.save



