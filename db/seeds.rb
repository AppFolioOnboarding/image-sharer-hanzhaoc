# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
image_list = [
  ['A dog', 'https://images2.minutemediacdn.com/image/upload/c_crop,h_1192,w_2121,x_0,y_163/f_au\
    to,q_auto,w_1100/v1554742401/shape/mentalfloss/558828-istock-865223918.jpg'],
  ['An unfriendly dog', 'https://cdn.pixabay.com/photo/2018/05/07/10/48/husky-3380548__340.jpg'],
  ['some cat', 'https://upload.wikimedia.org/wikipedia/commons/6/66/An_up-close_picture_of_a_curio\
    us_male_domestic_shorthair_tabby_cat.jpg.jpg'],
  ['black cat', 'https://d17fnq9dkz9hgj.cloudfront.net/uploads/2013/09/cat-black-superstitious-fcs-cat-my\
    ths-162286659.jpg'],
  ['orange cat', 'https://upload.wikimedia.org/wikipedia/commons/thumb/3/3a/Cat03.jpg/1200px-Cat03.jpg'],
  ['bg cat', 'https://hackernoon.com/hn-images/1*mONNI1lG9VuiqovpnYqicA.jpeg'],
  ['smart cat', 'https://peopledotcom.files.wordpress.com/2018/02/two-tone-cat.jpg'],
  ['dog cat', 'https://d.newsweek.com/en/full/1517962/cat-vs-dog-international-cat-day.jpg'],
  ['sweep cat', 'https://media.allure.com/photos/5cfbf52c1113921c241b4d19/3:4/w_1124,h_1499,c_limit/ol\
    iver-the-cat-lede.jpg'],
  ['hidden cat', 'https://i.kinja-img.com/gawker-media/image/upload/s--rqCW9nxC--/c_scale,f_auto,fl_prog\
    ressive,q_80,w_800/p4b69sblvgebowkdhnfy.jpg'],
  ['curious cat', 'https://media.wired.com/photos/5bac2b22b1d78f2d745782f2/master/pass/catrat-82773559.jpg'],
  ['banner cat', 'https://www.catprotection.com.au/site/wp-content/uploads/2019/03/cat-banner.jpg'],
  ['cat need food', 'https://ichef.bbci.co.uk/images/ic/720x405/p0517py6.jpg'],
  ['life sucks cat', 'https://vets-now.s3.amazonaws.com/uploads/2018/05/shutterstock_410672992.jpg'],
  ['cat einstein', 'https://amp.businessinsider.com/images/5654150584307663008b4ed8-750-563.jpg'],
  ['catty perry', 'https://cdn.pixabay.com/photo/2018/04/20/17/18/cat-3336579__340.jpg'],
  ['cafka', 'https://www.northeastanimalshelter.org/wp-content/uploads/2019/08/Annie.121474-300x300.jpg'],
  ['jacat ma', 'https://i.cbc.ca/1.5123077.1556930302!/fileImage/httpImage/image.jpeg_gen/derivatives/16x9_7\
    80/cat-thrown-out-of-vehicle.jpeg'],
  ['seducing cat', 'https://amp.insider.com/images/5aff269c5e48ec1d008b461e-750-563.jpg'],
  ['fml cat', 'https://www.catster.com/wp-content/uploads/2017/09/A-gray-cat-with-yellow-eyes-mouth-open.jpg']
]

image_list.each do |title, link|
  Image.create!(title: title, link: link)
end
