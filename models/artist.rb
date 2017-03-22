require ('pg')
require_relative('../db/sql_runner')
require_relative('album')

class Artist

  attr_reader :id, :name

  def initialize(options)
    @id = options['id'].to_i
    @name
  end

  def self.all()
    sql = "SELECT * FROM artists"
    result = SqlRunner.run(sql)
    artists = result.map{|artist| Customer.new(artist)}
    return artists
  end

  def self.delete_all()
    sql = "DELETE FROM artists"
    SqlRunner.run(sql)
  end

  def save()
    sql = "INSERT INTO artists (name)
     VALUES ('#{@name}') 
     RETURNING *"
    @id = SqlRunner.run(sql).first()["id"].to_i

  end

  def delete()
    sql = "DELETE FROM artists WHERE id = #{@id}"
    SqlRunner.run(sql)  
  end

  def update()
    sql = "UPDATE artists
          SET (name) 
          = ('#{@name}')
          WHERE id = #{@id}"
    SqlRunner.run(sql)
  end

  def albums()
    sql = "SELECT * FROM albums WHERE artist_id = #{@id}"
    result = SqlRunner.run(sql)
    result = result.map{|album| PizzaOrder.new(album)}
    return result
  end

end