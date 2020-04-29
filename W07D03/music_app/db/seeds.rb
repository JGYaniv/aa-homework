# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

b1 = Band.create!(name: "Bees")
b2 = Band.create!(name: "Worms")

a1 = Album.create!(title: "Sweet", year: "1990", band_id: b1.id)
a2 = Album.create!(title: "Nectar", year: "1992", band_id: b1.id)
a3 = Album.create!(title: "Dirty", year: "2000", band_id: b2.id)

t1 = Track.create!(title: "Pollen's Great", ord: 1, album_id: a1.id)
t2 = Track.create!(title: "Pollen's Grand", ord: 2, album_id: a1.id)
t3 = Track.create!(title: "Long Live the Queen", ord: 3, album_id: a1.id)

t4 = Track.create!(title: "Drizzly", ord: 1, album_id: a2.id)
t5 = Track.create!(title: "Ambrosia", ord: 2, album_id: a2.id)
t6 = Track.create!(title: "Stinger", ord: 3, album_id: a2.id)

t7 = Track.create!(title: "Decaying Lady", ord: 1, album_id: a3.id)
t8 = Track.create!(title: "Rotten Fruit", ord: 2, album_id: a3.id)
t9 = Track.create!(title: "Time's Up", ord: 3, album_id: a3.id)