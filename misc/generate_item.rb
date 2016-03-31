description = ["solid", "elegant", "home-made", "delicious", "amazing", "world-class",
    "antiquated", "rare", "collection"]
size = ["extra-small", "small", "medium", "large", "extra-large", "jumbo"]

item_list = ["carrots", "watermelon", "melon", "Honey Dew", "Mouse", "Laptop",
       "tshirt", "water-bottle"]

stores = Store.all

store_count = stores.count 

desc_length = description.length 
size_length = size.length 
item_length = item_list.length 
price_max   = 200.0

for i in 1..2000
    r1 = rand(desc_length)
    r2 = rand(desc_length)
    r3 = rand(size_length)
    r4 = rand(item_length)
    r5 = rand(store_count)
    r6 = rand(price_max)

    item_name = description[r1] + ", " + description[r2] + 
    ", " + size[r3] + " " + item_list[r4]

    Item.create(
        store_id: r5,
        name: item_name,
        price: r6,
        details: item_name
        )
end
