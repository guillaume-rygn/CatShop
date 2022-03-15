#destroy all seed before db:seed
User.destroy_all
Cart.destroy_all
Item.destroy_all
Order.destroy_all
JoinTableCartItem.destroy_all
JoinTableItemOrder.destroy_all

#Create 10 users
10.times do |t|
  user = User.create!(
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    password: Faker::Lorem.sentence,
    adress: Faker::Address.street_address,
    zipcode: Faker::Address.zip_code,
    email: "email#{t}@yopmail.com"
  );
end

#Create 20 items
20.times do
  item = Item.create(
    title: Faker::Creature::Cat.name,
    description: Faker::Creature::Cat.breed,
    price: 19.99,
    image_url: "https://images.theconversation.com/files/443350/original/file-20220131-15-1ndq1m6.jpg?ixlib=rb-1.1.0&rect=0%2C0%2C3354%2C2464&q=45&auto=format&w=926&fit=clip"
  );
end

#Create 5 carts
5.times do
  cart = Cart.create(
    user_id: User.all.sample.id
  );
end

#Create 5 orders
5.times do
  order = Order.create(
    user_id: User.all.sample.id
  );
end

#Create 5 join_table_cart_item
5.times do
  join_table_cart_items = JoinTableCartItem.create(
    item_id: Item.all.sample.id,
    cart_id: Cart.all.sample.id
  );
end

#Create 5 join_table_item_order
5.times do
  join_table_item_orders = JoinTableItemOrder.create(
    item_id: Item.all.sample.id,
    order_id: Order.all.sample.id
  );
end
