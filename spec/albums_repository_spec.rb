require_relative '../lib/albums_repository'

def reset_albums_table
  seed_sql = File.read('spec/seeds_albums.sql')
  connection = PG.connect({ host: '127.0.0.1', dbname: 'music_library_test' })
  connection.exec(seed_sql)
end

RSpec.describe AlbumsRepository do
  
  before(:each) do 
    reset_albums_table
  end

  it 'returns a list of all albums' do
      repo = AlbumsRepository.new
      
      albums = repo.all
      
      expect(albums.length).to eq 12
      
      expect(albums[0].id).to eq '1'
      expect(albums[0].title).to eq 'Doolittle'
      expect(albums[0].release_year).to eq '1989'
      expect(albums[0].artist_id).to eq '1'

      expect(albums[-1].id).to eq '12'
      expect(albums[-1].title).to eq 'Ring Ring'
      expect(albums[-1].release_year).to eq '1973'
      expect(albums[-1].artist_id).to eq '2'
  end

  it 'returns an album by its id' do
    repo = AlbumsRepository.new
    selection = repo.find(2)
    expect(selection.title).to eq 'Surfer Rosa'
  end

end