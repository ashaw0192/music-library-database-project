Music Library Albums Model and Repository Classes Design Recipe

1. Design and create the Table

2. Create Test SQL seeds

3. Define the class names

# Table name: albums

# Model class
# (in lib/albums.rb)

class Albums
end

# Repository class
# (in lib/albums_repository.rb)
class AlbumsRepository
end

4. Implement the Model class

# Table name: albums

# Model class
# (in lib/albums.rb)

class Albums
  attr_accessor :id, :title, :release_year, :artist_id
end

5. Define the Repository Class interface

Using comments, define the method signatures (arguments and return value) and what they do - write up the SQL queries that will be used by each method.

# Table name: albums

# Repository class
# (in lib/albums_repository.rb)

class AlbumsRepository

```ruby

  # Selecting all albums
  # No arguments
  def all
    # Executes the SQL query:
    # SELECT id, title, release_year, artist_id FROM albums
  ;

    # Returns an array of Albums objects.
  end

  # Gets a single album by its ID
  # One argument: the id (number)
  def find(id)
    # Executes the SQL query:
    # SELECT id, title, release_year, artist_id FROM albums WHERE id = id;

    # Returns a single Album object.
  end

  # Adds an album to the albums table
  # One argument, the album object
  def creat(album)
    # Executes the SQL query:
    # INSERT INTO albums (title, release_year, artist_id) VALUES ($1, $2, $3);
  end


```
6. Write Test Examples

```ruby
# 1
# Get all albums

repo = AlbumsRepository.new

albums = repo.all

albums.length # =>  12

albums[0].id # =>  1
albums[0].title # =>  'Doolittle'
albums[0].release_year # =>  '1989'
albums[0].artist_id # =>  '1'

albums[-1].id # =>  12
albums[-1].title # =>  'Ring Ring'
albums[-1].release_year # =>  '1973'
albums[-1].artist_id # =>  '2'

# 2
# Get a single album

repo = AlbumsRepository.new

album = repo.find(1)

album.id # =>  1
album.name # =>  'Doolittle'
album.release_year # =>  '1989'
album.artist_id # => '1'

# 3 
# Create a new record for an album

repo = AlbumsRepository.new

album = Album.new
album.title = 'Trompe le Monde'
album.release_year = 1991
album.artist_id = 1

repo.create(album)

albums = repo.all
albums.length # => 6
albums[-1].id # => '6'
albums[-1].title # => 'Trompe le Monde'
albums[-1].release_year # => '1991'
albums[-1].artist_id # => '1'


# Add more examples for each method
Encode this example as a test.

```

7. Reload the SQL seeds before each test run

Running the SQL code present in the seed file will empty the table and re-insert the seed data.

This is so you get a fresh table contents every time you run the test suite.

# EXAMPLE

# file: spec/student_repository_spec.rb

def reset_albums_table
  seed_sql = File.read('spec/seeds_albums
.sql')
  connection = PG.connect({ host: '127.0.0.1', dbname: 'albums
' })
  connection.exec(seed_sql)
end

describe StudentRepository do
  before(:each) do 
    reset_albums
  _table
  end

  # (your tests will go here).
end
8. Test-drive and implement the Repository class behaviour

After each test you write, follow the test-driving process of red, green, refactor to implement the behaviour.

