# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

## Descriptions taken from wikipedia

require 'faker'

admin = User.create(
  first_name: 'admin',
  last_name: 'admin',
  email: 'admin@admin.cl',
  password: 'Admin1234',
  role: 'admin',
  )

### Create Genres
rock = Genre.create(name: 'rock')
jazz = Genre.create(name: 'jazz')
classic = Genre.create(name: 'clásica')
electronic = Genre.create(name: 'electrónica')
pop = Genre.create(name: 'pop')
reggae = Genre.create(name: 'reggae')
metal = Genre.create(name: 'metal')
punk = Genre.create(name: 'punk')
folclore = Genre.create(name: 'folclore')
progresive_rock = Genre.create(name: 'rock progresivo')

### Create Users
juan = User.create(
  first_name: 'Juan',
  last_name: 'Rodriguez',
  email: 'juan_rodriguez@gmail.com',
  password: 'Juan1234',
  password_confirmation: 'Juan1234',
  )
pedro = User.create(
  first_name: 'Pedro',
  last_name: 'Martinez',
  email: 'pmartinez@yahoo.com',
  password: 'Pedro1234',
  password_confirmation: 'Pedro1234',
  )
diego = User.create(
  first_name: 'Nicolas',
  last_name: 'Tapia',
  email: 'nicot123@uc.cl',
  password: 'Nicolas1234',
  password_confirmation: 'Nicolas1234',
  )
luciano = User.create(
  first_name: 'Luciano',
  last_name: 'Chiang',
  email: 'lucianochiang@musicapp29.com',
  password: 'Luciano1234',
  password_confirmation: 'Luciano1234',
  )
david = User.create(
  first_name: 'David',
  last_name: 'Fuller',
  email: 'davidfuller@musicapp29.com',
  password: 'David1234',
  password_confirmation: 'David1234',
  )
pablo = User.create(
  first_name: 'Pablo',
  last_name: 'Pino',
  email: 'pablopino@musicapp29.com',
  password: 'Pablo1234',
  password_confirmation: 'Pablo1234',
  )
camila = User.create(
  first_name: 'Camila',
  last_name: 'Sanchez',
  email: 'casanchez@hotmail.com',
  password: 'Camila1234',
  password_confirmation: 'Camila1234',
  )
florencia = User.create(
  first_name: 'Florencia',
  last_name: 'Gomez',
  email: 'flo43@gmail.com',
  password: 'Florencia1234',
  password_confirmation: 'Florencia1234',
  )

### Create artists
pink_floyd = Artist.create({
  name: 'Pink Floyd',
  description: 'Pink Floyd es una banda de rock británica, considerada un icono cultural del siglo xx y una de las bandas más influyentes en la historia de la música, que obtuvo gran popularidad gracias a su música psicodélica que evolucionó hacia el rock progresivo con el paso del tiempo. Es conocida por sus canciones de alto contenido filosófico, la experimentación sónica, las innovadoras portadas de sus discos y sus elaborados espectáculos en vivo.',
  country: 'Inglaterra',
  members: 'Roger Waters, David Gilmour, Nick Mason, Richard Wright',
  active_since: '1965',
  active_until: '1995',
  owner_id: admin.id,
  })
pink_floyd.genres << rock

queen = Artist.create({
  name: 'Queen',
  description: 'Queen es una banda británica de rock formada en 1970 en Londres por el cantante Freddie Mercury, el guitarrista Brian May, el baterista Roger Taylor y el bajista John Deacon.',
  country: 'Inglaterra',
  members: 'Brian May, Freddie Mercury, John Deacon, Roger Taylor',
  active_since: '1970',
  # active_until: '',
  owner_id: admin.id,
  })
queen.genres << rock

iron_maiden = Artist.create({
  name: 'Iron Maiden',
  description: 'Iron Maiden es una banda británica de heavy metal, fundada en 1975 por el bajista Steve Harris. Es considerada una de las bandas de Heavy Metal más importantes de todos los tiempos. Ha vendido más de 100 millones de discos en todo el mundo, a pesar de haber contado con poco apoyo de la radio y la televisión comercial durante la mayor parte de su carrera.',
  country: 'Inglaterra',
  members: 'Steve Harris, Bruce Dickinson, Dave Murray, Adrian Smith, Janick Gers, Nicko McBrain',
  active_since: '1975',
  # active_until: '',
  owner_id: admin.id,
  })
iron_maiden.genres << [rock, metal]

maroon_5 = Artist.create({
  name: 'Maroon 5',
  description: 'Maroon 5 es una banda musical de Pop y Pop Rock1​ estadounidense. El grupo se formó originalmente entre 1994 y 1995 como Kara\'s Flowers mientras sus integrantes cursaban la secundaria.',
  country: 'Estados Unidos',
  members: 'Adam Levine, Mickey Madden, James Valentine, Matt Flynn, P. J. Morton, Jesse Carmichael, Sam Farrar',
  active_since: '1994',
  active_until: '',
  owner_id: admin.id,
  })
maroon_5.genres << pop

bruno_mars = Artist.create({
  name: 'Bruno Mars',
  description: 'Peter Gene Hernandez (Honolulú, 8 de octubre de 1985), conocido como Bruno Mars, es un cantante, compositor, productor musical y coreógrafo estadounidense.',
  country: 'Hawai',
  members: '',
  active_since: '2008',
  active_until: '',
  owner_id: admin.id,
  })
bruno_mars.genres << pop

coldplay = Artist.create({
  name: 'Coldplay',
  description: 'Coldplay es una banda británica de pop rock formada en Londres en 1996. El grupo está integrado por Chris Martin (voz, teclado, guitarra), Jon Buckland (guitarra principal), Guy Berryman (bajo eléctrico) y Will Champion (batería, coros y otros instrumentos).',
  country: 'Inglaterra',
  members: 'Jonny Buckland, Will Champion, Chris Martin, Guy Berryman.',
  active_since: '1996',
  active_until: '',
  owner_id: admin.id,
  })
coldplay.genres << [pop, rock]

bob_marley = Artist.create({
  name: 'Bob Marley',
  description: 'Bob Marley fue un músico, guitarrista y compositor jamaicano. Durante su carrera musical fue el líder, compositor y guitarrista de las bandas de ska, rocksteady y reggae The Wailers (1964-1974) y Bob Marley & The Wailers (1974-1982).',
  country: 'Jamaica',
  members: '',
  active_since: '1962',
  active_until: '1980',
  owner_id: admin.id,
  })
bob_marley.genres << reggae


### Create songs
brick = Song.create({ name: 'Another brick in the wall' })
wish_song = Song.create({ name: 'Wish you were here' })
numb = Song.create({ name: 'Comfortably numb' })
machine = Song.create({ name: 'Welcome to the machine' })
pink_floyd.songs << [brick, wish_song, numb, machine]


### Create albums
wish = Album.create({
  name: 'Wish you were here',
  release_date: '1975-09-13',
  is_single: false,
  description: 'Wish You Were Here es el noveno álbum de estudio de la banda británica de rock Pink Floyd, lanzado en septiembre de 1975 e inspirado en el material que compusieron durante su gira europea de 1974 y que grabaron en los Abbey Road Studios de Londres.'
  })
wish.artists << pink_floyd
wish.songs << [machine, wish_song]

### Create fake artists:
# artists = Artist.create( Array.new(10) do
#     n_members = Faker::Number.between(1, 5)
#     members = Array.new(n_members) { Faker::Name.name }
#     members = members.join(", ")
#     {
#       name: Faker::Name.unique.name,
#       description: Faker::Lorem.paragraph,
#       country: Faker::Address.country,
#       members: members,
#       active_since: Faker::Date.backward(100),
#       active_until: Date.today,
#       owner_id: admin.id
#     }
#   end)
