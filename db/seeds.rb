#destroy all seed before db:seed
Category.destroy_all
User.destroy_all
Cart.destroy_all
Item.destroy_all
Order.destroy_all
JoinTableCartItem.destroy_all
JoinTableItemOrder.destroy_all

cat = ["https://images.theconversation.com/files/443350/original/file-20220131-15-1ndq1m6.jpg?ixlib=rb-1.1.0&rect=0%2C0%2C3354%2C2464&q=45&auto=format&w=926&fit=clip","https://resize2.prod.docfr.doc-media.fr/rcrop/1200,675,center-middle/img/var/doctissimo/storage/images/fr/www/animaux/chat/comportement-chat/le-langage-du-chat/712285-4-fre-FR/le-langage-du-chat.jpg","https://lemagduchat.ouest-france.fr/images/dossiers/2021-12/marche-chat-france-164220.jpg","https://img.passeportsante.net/1000x526/2021-06-01/i107848-eduquer-un-chaton.jpeg","https://upload.chatsdumonde.com/img_global/24-adopter-un-chat/aspects-pratiques-de-l-adoption-d-un-chat/_light-1334-arrivee-d-un-chaton-a-la-maison-preparer-son-environnement.jpg","https://jardinage.lemonde.fr/images/dossiers/2017-08/chaton-161238.jpg","https://www.zooplus.fr/magazine/wp-content/uploads/2019/06/arriv%C3%A9e-dun-chaton-%C3%A0-la-maison.jpeg","https://i-dja.unimedias.fr/sites/art-de-vivre/files/styles/large/public/dj115_chaton_th.jpg?auto=compress%2Cformat&crop=faces%2Cedges&cs=srgb&fit=crop&h=603&w=900","https://absolumentchats.com/wp-content/uploads/2021/03/petit-chaton-endormi.jpg","https://lemagduchat.ouest-france.fr/images/dossiers/2021-03/chaton-sante-071707.jpg","https://jardinage.lemonde.fr/images/dossiers/2019-08/chaton-071848.jpg","https://img.passeportsante.net/1000x526/2021-04-20/i101449-sexe-du-chaton.jpeg","https://pbs.twimg.com/media/C3-00h0WYAEj3QZ.jpg","https://www.lalibre.be/resizer/qx1eODgDCCu1bydWqKJDWU9Bjsg=/768x512/filters:quality(70):format(jpg):focal(380x197.5:390x187.5)/cloudfront-eu-central-1.images.arcpublishing.com/ipmgroup/LPUFVTNNPNDOTBA7DJPCQT7XNE.jpg","https://img.huffingtonpost.com/asset/5c933b0b2400007e064e38dc.jpeg?ops=1200_630","http://www.chat-mignon.com/photos/chaton-grenouille.jpg"]

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

    image_url: cat.sample,

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

#Create 1 admin

user = User.create!(
  first_name: "The",
  last_name: "Adminisatator",
  password: "azerty",
  email: "admin@yopmail.com",
  is_admin: true,
);
