require_relative 'lib/database_connection'
require_relative 'lib/albums_repository'

DatabaseConnection.connect('music_library')

repo = AlbumsRepository.new

repo.all.each do |album|
  p album
end