require ('pry')
require_relative('models/artist')
require_relative('models/album')


Album.delete_all()
Artist.delete_all()

artist1 = Artist.new({'name' => '50 Cent'})
artist1.save()

album1 = Album.new({'artist_id' => artist1.id , 'title' => 'Get Rich or Die Tryin', 'genre' => 'rap'})
album2 = Album.new({'artist_id' => artist1.id , 'title' => 'The Massacre', 'genre' => 'rap'})


album1.save()
album2.save()

album1.artist()




# order2.delete()

binding.pry
nil