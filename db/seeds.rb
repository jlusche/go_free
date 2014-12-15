Location.destroy_all 

locations = Location.create([
  { name:   'Autry National Center of the American West (in Griffith Park)', address: '4700 Western Heritage Way, Los Angeles, CA 90027'},
  { name:   'California Science Center', address: '700 Exposition Park Dr, Los Angeles, CA 90037'},
  { name:   'California African American Museum', address: '600 State Dr, Los Angeles, CA 90037'},
  { name:   'Craft & Folk Art Museum', address: '5814 Wilshire Blvd, Los Angeles, CA 90036'},
  { name:   'Dominguez Rancho Adobe Museum', address: '18127 S Alameda St, Compton, CA 90220'}
=begin
  { name:   'UCLA Fowler Museum at UCLA', city: 'Los Angeles'},
  { name:   'Griffith Observatory', city: 'Los Angeles'},
  { name:   'J. Paul Getty Museum', city: 'Los Angeles'},
  { name:   'J. Paul Getty Villa', city: 'Los Angeles'},
  { name:   'UCLA Hammer Museum ', city: 'Los Angeles'},
  { name:   'The Huntington Library, Art Collections, and Botanical Gardens', city: 'Los Angeles'},
  { name:   'Japanese American National Museum', city: 'Los Angeles'},
  { name:   'LACMA', city: 'Los Angeles'},
  { name:   'Los Angeles Museum of the Holocaust', city: 'Los Angeles'},
  { name:   'Museum of Contemporary Art, Los Angeles', city: 'Los Angeles'},
  { name:   'Natural History Museum of Los Angeles County', city: 'Los Angeles'},
  { name:   'Norton Simon Museum', city: 'Los Angeles'},
  { name:   'USC Pacific Asia Museum', city: 'Los Angeles'},
  { name:   'Page Museum La Brea Tar Pits', city: 'Los Angeles'},
  { name:   'Santa Monica Museum of Art', city: 'Los Angeles'},
  { name:   'Travel Town Museum', city: 'Los Angeles'},
  { name:   'USC Fisher Museum of Art', city: 'Los Angeles'},
  { name:   'UCLA Meteorite Gallery', city: 'Los Angeles'},
  { name:   'Banning Residence Museum', city: 'Los Angeles'},
  { name:   'Hollywood Bowl Museum', city: 'Los Angeles'},
  { name:   'Homestead Museum', city: 'Los Angeles'},
  { name:   'Annenberg Space for Photography', city: 'Los Angeles'},
  { name:   'The Paley Center for Media', city: 'Los Angeles'},
  { name:   'The Fashion Institute of Design & Merchandising', city: 'Los Angeles'},
  { name:   'RedCat', city: 'Los Angeles'},
  { name:   'Barnsdall Art Park Gallery', city: 'Los Angeles'},
  { name:   'MOCA Geffen Contemporary', city: 'Los Angeles'},
  { name:   'MOCA Pacific Design Center', city: 'Los Angeles'},
  { name:   'Historic Southwest Museum Mt. Washington Campus', city: 'Los Angeles'},
  { name:   'Skylight Studios', city: 'Los Angeles'},
  { name:   'Sonos Studio', city: 'Los Angeles'}
=end
  ])

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
