
require('pry-byebug')
require_relative('models/Artists.rb')
require_relative('models/Albums.rb')

# Artist.delete_all()
Album.delete_all()

artist1 = Artist.new({
                     'first_name' => 'Ariana',
                     'last_name' =>  'Grande',
                     'list_albums' => '3'

                     })

artist1.save()

artist2 = Artist.new({
                     'first_name' => 'Edward',
                     'last_name' =>  'Christopher',
                     'list_albums' => '2'
                     })

artist2.save()

artist3 = Artist.new({

                     'first_name' => 'Beyonce',
                     'last_name'  => 'Knowles',
                     'list_albums' => '2'
                     })

artist3.save()

album1 = Album.new({
                   'title' => 'Sweetner',
                   'genre' => 'pop',
                   'artist_id' => "#{artist1.id}"
                   })

album1.save()

album2 = Album.new({
                   'title' => 'Thank u Next',
                   'genre' => 'pop',
                   'artist_id' => "#{artist1.id}"
                   })

album2.save()

album3 = Album.new({
                   'title' => 'Dangerous Woman',
                   'genre' => 'pop',
                   'artist_id' => "#{artist1.id}"

                   })

album3.save()

album4 = Album.new({
                   'title' => 'Divide',
                   'genre'  => 'pop',
                   'artist_id' => "#{artist2.id}"

                   })

album4.save()

album5 = Album.new({

                   'title' => 'Plus',
                   'genre'=>  'pop',
                   'artist_id' => "#{artist2.id}"

                   })

album5.save()


album6 = Album.new({

                   'title' => 'Lemonade',
                   'genre' =>  'pop',
                   'artist_id' => "#{artist3.id}"

                   })

album6.save()

album7 = Album.new({

                   'title' => 'Beyance',
                   'genre' =>  'pop',
                   'artist_id' => "#{artist3.id}"

                   })

album7.save()

binding.pry()



nil
