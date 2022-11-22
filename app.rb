require_relative 'lib/database_connection'
require_relative 'lib/albums_repository'

DatabaseConnection.connect('music_library')

repo = AlbumsRepository.new

repo.all.each do |album|
  p album
end

found = repo.find(3)
p found.id + " - " + found.title + " - " + found.release_year + " - " + found.artist_id