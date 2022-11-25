require_relative 'albums'

class AlbumsRepository
  def inflate(uninflated)
  inflated = Albums.new
  inflated.id = uninflated['id']
  inflated.title = uninflated['title']
  inflated.release_year = uninflated['release_year']
  inflated.artist_id = uninflated['artist_id']
  return inflated
  end

  def all
    sql = "SELECT id, title, release_year, artist_id FROM albums;"
    result_set = DatabaseConnection.exec_params(sql, [])

    album_list = []

    result_set.each do |data|
      album_list << inflate(data)
    end
    return album_list
  end

  def find(id)
    sql = "SELECT id, title, release_year, artist_id FROM albums WHERE id = $1;"
    params = [id]
    result = DatabaseConnection.exec_params(sql, params)
    
    return inflate(result[0])
  end

  def create(album)
    sql = 'INSERT INTO albums (title, release_year, artist_id) VALUES ($1, $2, $3);'
    params = [album.title, album.release_year, album.artist_id]
    result = DatabaseConnection.exec_params(sql, params)
  end
end