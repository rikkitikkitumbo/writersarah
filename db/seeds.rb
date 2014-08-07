# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Cat.create(title: "Magazine", descript: "My articles always go #1!!", order_array: "1,2,3,4,5,6,7,8,9,10,11,12,13,14,15")
Cat.create(title: "Coorperate Copywright", descript: "I'll make you look so professional you won't need to wear a suit and tie!!!", order_array: "1,2,3,4,5,6,7,8,9,10,11,12,13,14,15")
Cat.create(title: "Novels", descript: "I have written two novels, and they are both available at Amazon.com", order_array: "1,2,3,4,5,6,7,8,9,10,11,12,13,14,15")


Cat.all.each do |cat|
  5.times do |n|
    Article.create(title: "Article #{n + 1} of #{cat.title} category", article_link: "#", descript: "Feb #{n + 1}, 2013", cat_id: cat.id, cat_title: "#{cat.title}")
  end
end





