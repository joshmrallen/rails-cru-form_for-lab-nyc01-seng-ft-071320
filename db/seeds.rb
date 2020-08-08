require 'faker'

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Artist.delete_all
Song.delete_all
Genre.delete_all


20.times do 
    Artist.create(name: Faker::Name.name, bio: Faker::Lorem.paragraphs)
end

20.times do
    Genre.create(name: Faker::Music.genre)
end

Artist.all.each do |artist|
    Genre.all.each do |genre|
        Song.create(name: Faker::Music.album, artist_id: artist.id, genre_id: genre.id)
    end
end

