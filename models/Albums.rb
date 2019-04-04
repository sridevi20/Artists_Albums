require_relative('../db/sql_runner.rb')
require_relative('Artists.rb')

class Album

  attr_accessor :title, :genre, :artist_id
  attr_reader :id
  def initialize(collections)
    @id = collections['id'].to_i() if collections['id']
    @title = collections['title']
    @genre = collections['genre']
    @artist_id = collections['artist_id'].to_i()
  end

  def save()
    sql = "INSERT INTO albums (title, genre, artist_id)
    VALUES($1, $2, $3) RETURNING id"
    values = [@title, @genre, @artist_id]
    results = SqlRunner.run(sql, values)
    @id = results[0]["id"].to_i() ##
  end

  def self.all()
    sql = "SELECT * FROM albums"
    results = SqlRunner.run(sql)
    return results.map {|collection|Album.new(collection)}
  end

  def self.delete_all()

    sql = "DELETE FROM albums"

    SqlRunner.run(sql)

  end

  def delete()
    sql = "DELETE FROM albums WHERE id = $2"
    values = [@id]
    results =  SqlRunner.run(sql,values)
  end

  def update()
    sql = "UPDATE albums SET (title, genre, artist_id) =
    ($1, $2, $3,) WHERE id = $1"
    values = [@title, @genre, @artist_id, @id]
    results = SqlRunner.run(sql, values)
    @id = results[0]["id"].to_i()
  end
end
  #def find artist_id_albums()
