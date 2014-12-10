# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

# Sample locations
Location.create(name: 'Tapiolan Urheilupuisto', address: 'Urheilupuistontie 2, Espoo', phone: '046 877 1352')
Location.create(name: 'Arena Center Myllypuro', address: 'Alakiventie 2, Helsinki', phone: '020 710 9901', url: 'http://www.arenacenter.fi/arena-center/myllypuro/')
Location.create(name: 'Barona Areena', address: 'Urheilupuistontie 3, Espoo', phone: '0207 352 180', url: 'http://www.baronaareena.com/')

# Sample events
Event.create(name: 'Blues Joulushow 2014', description: 'Blues Joulushow, esiintyjinä Jenni Vartiainen, JVG ja Arttu Viskari', start_time: DateTime.new(2014, 12, 18, 17, 00, 00), end_time: DateTime.new(2014, 12, 18, 20, 00, 00), location: Location.where(name: 'Barona Areena').first)
Event.create(name: 'Helsinki Floorball Cup 2015', description: 'Suomen suurin salibandyturnaus', start_time: DateTime.new(2015, 01, 02, 06, 00, 00), end_time: DateTime.new(2015, 01, 04, 18, 00, 00), location: Location.where(name: 'Arena Center Myllypuro').first)
