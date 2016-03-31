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

for i in 1..500
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
    message = message + "from " + stores[store_rand] + ending

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