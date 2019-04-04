require_relative('../db/sql_runner.rb')
require_relative('Albums.rb')
class Artist

  attr_reader :id
  attr_accessor :first_name, :last_name, :list_albums


  def initialize(collections)
    @id = collections['id'].to_i() if collections['id']
    @first_name = collections['first_name']
    @last_name = collections['last_name']
    @list_albums = collections['list_albums'].to_i()
  end

  def save()
    sql = "INSERT INTO artists (first_name, last_name, list_albums)
    VALUES($1, $2, $3) RETURNING id"

    values = [@first_name, @last_name, @list_albums]

    @id = SqlRunner.run(sql, values) [0]['id'].to_i()
  end

  def self.all()

    sql = "SELECT * FROM artists"

    results = SqlRunner.run(sql)

    return results.map{ |collection| Artist.new(collection)}
  end

  # def self.delete_all()
  #
  #   sql = "DELETE FROM artists"
  #
  #   SqlRunner.run(sql)
  #
  # end

  def delete()

    sql = "DELETE FROM artists WHERE id = $1 "

    values = [@id]

    results = SqlRunner.run(sql, values)
  end

  def update()
    sql = "UPDATE artists SET(first_name, last_name, list_albums)
    = ($1,$2,$3) WHERE id = $2"

    values = [@first_name, @last_name, @list_albums,@id]

    results = SqlRunner.run(sql,values)
    @id = results[0]["id"].to_i()
  end

  def artist_albums()
    sql = "SELECT * FROM albums WHERE artist_id = $1 "
    values = [@id]
    results = SqlRunner.run(sql, values)
    return results.map{|artist| Album.new(artist)}
  end
end
