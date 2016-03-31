# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

stores = [
{
    name: 'Unicorn Store',
    address: 'St. Unicorn street',
    zipcode: '124543',
    state: 'MI',
    country: 'USA',
    longitude: '124.5',
    latitude: '50'    
},
{
    name: 'Chicken Store',
    address: 'Poultry Street',
    zipcode: '124533',
    state: 'MI',
    country: 'USA',
    longitude: '123.5',
    latitude: '50'    
},
{
    name: 'Wheel Store',
    address: 'St. Wheel street',
    zipcode: '124543',
    state: 'MI',
    country: 'USA',
    longitude: '124.5',
    latitude: '50'    
},
{
    name: 'Laptop Store',
    address: 'St. Laptop street',
    zipcode: '124543',
    state: 'MI',
    country: 'USA',
    longitude: '124.5',
    latitude: '50'    
},
{
    name: 'Real Shopping mall',
    address: 'Mouse street',
    zipcode: '124543',
    state: 'MI',
    country: 'USA',
    longitude: '124.5',
    latitude: '50'    
},
{
    name: 'Bottle Store',
    address: 'Cn street',
    zipcode: '124543',
    state: 'MI',
    country: 'USA',
    longitude: '124.5',
    latitude: '50'    
},
]


# Store.create(stores)

# description = ["solid", "elegant", "home-made", "delicious", "amazing", "world-class",
#     "antiquated", "rare", "collection"]
# size = ["extra-small", "small", "medium", "large", "extra-large", "jumbo"]

# item_list = ["carrots", "watermelon", "melon", "Honey Dew", "Mouse", "Laptop",
#        "tshirt", "water-bottle"]

# stores = Store.all

# store_count = stores.count 

# desc_length = description.length 
# size_length = size.length 
# item_length = item_list.length 
# price_max   = 200.0

# for i in 1..2000
#     r1 = rand(desc_length)
#     r2 = rand(desc_length)
#     r3 = rand(size_length)
#     r4 = rand(item_length)
#     r5 = rand(store_count)
#     r6 = rand(price_max)

#     item_name = description[r1] + ", " + description[r2] + 
#     ", " + size[r3] + " " + item_list[r4]

#     Item.create(
#         store_id: r5,
#         name: item_name,
#         price: r6,
#         details: item_name
#         )
# end

description = ["solid ", "elegant ", "home-made ", "delicious ", "amazing ", "world-class ",
    "antiquated ", "rare ", "collectibles "]

item_list = ["carrots ", "watermelon ", "melon ", "Honey Dew ", "Mouse ", "Laptop ",
       "tshirt ", "water-bottle "]

stores = ["Wallgreens ", "CVS ", "Mars ", "Moon "]

introduction = ["I would like ", "I would love to ", "Can someone get me "]

ending = ["maybe later", ".No rush!", "now!"]

desc_length = description.length 
item_length = item_list.length 
stores_length = stores.length
intro_length  = introduction.length
ending_length = ending.length

for i in 1..5
    intro_rand = rand(intro_length)
    item_rand = rand(item_length)
    store_rand = rand(stores_length)
    desc_rand  = rand(desc_length)
    ending_rand = rand(ending_length)

    tel_number = ""

    for i in 1..10
        temp = rand(10).to_s
        tel_number = tel_number + temp
    end

    message = introduction[intro_rand] + description[desc_rand] + item_list[item_rand]
    message = message + "from " + stores[store_rand] + ending[ending_rand]

    time = rand(70)

    Order.create(
        phone_number: tel_number,
        message: message,
        time_left: time,
        status: 0,
        item: item_list[item_rand],
        description: description[desc_rand]
        )

end 