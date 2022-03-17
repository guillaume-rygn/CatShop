#destroy all seed before db:seed
Category.destroy_all
User.destroy_all
Cart.destroy_all
Item.destroy_all
Order.destroy_all
JoinTableCartItem.destroy_all
JoinTableItemOrder.destroy_all



#Create 5 categories
5.times do |t|
   category = Category.create(breed: Faker::Creature::Cat.breed );
end


#Create 20 items
15.times do |t|
  item = Item.create!(
    title: "#{Faker::Creature::Cat.name}#{t}",
    description: "Joli petit chat des montagnes au pelage soyeux et arborant de toute odeur au vent le vent demain venant !",
    price: 19.99,
    image_url: "https://images.theconversation.com/files/443350/original/file-20220131-15-1ndq1m6.jpg?ixlib=rb-1.1.0&rect=0%2C0%2C3354%2C2464&q=45&auto=format&w=926&fit=clip",
    category_id: Category.all.sample.id
  );
end

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




