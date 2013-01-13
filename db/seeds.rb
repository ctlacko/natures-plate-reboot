# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
#

admins = User.seed ({ email: 'ctlacko@gmail.com', password: 'tinjat.', confirmed: true, admin: true }, { email: 'baker_annette@hotmail.com', password: 'tinjat.', confirmed: true, admin: true })
home_page = HomePost.create ( { 
 bottom_body: 'Initial bottom_body', 
 top_body: 'Initial top_body',
 bottom_title: 'Initial bottom_title',
 top_title: 'Initial top_title'
})
Page.create ( {
  name: 'Philosophy',
  content: 'Initial Philosophy.' ,
  permalink: 'philosophy'
} )
Page.create ( {
  name: 'Order',
  content: 'Coming soon.' ,
  permalink: 'order'
} )
Page.create ( {
  name: 'FAQ',
  content: 'Initial FAQ.' ,
  permalink: 'faq'
} ) 
Page.create ( {
  name: 'Contact',
  content: 'Initial Contact.' ,
  permalink: 'contact'
} )
  


