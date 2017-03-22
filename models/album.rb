require('pg')
require_relative('../db/sql_runner')
require_relative('artist')

class Album

  attr_writer :title, :genre
  attr_reader :id, :artist_id

  def initialize(options)
    @id = options['id'].to_i
    @title = options['title']
    @genre = options['genre']
    @artist_id = options['artist_id'].to_i
  end

end