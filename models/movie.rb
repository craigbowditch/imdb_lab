require_relative("../db/sql_runner")


class Movie

  attr_reader :id
  attr_accessor :title, :genre, :budget

  def initialize(options)
    @id = options['id'].to_i() if options['id']
    @title = options['title']
    @genre = options['genre']
    @budget = options['budget']
  end

  def save()
    sql = "INSERT INTO movies
    (title, genre) VALUES ($1, $2) RETURNING id"
    values = [@title, @genre]
    movie = SqlRunner.run(sql, values).first
    @id = movie['id'].to_i()
  end

  def self.all()
    sql = "SELECT * FROM movies"
    movies = SqlRunner.run(sql)
    result = movies.map {|movie| Movie.new(movie)}
    return result
  end

  def self.delete_all()
    sql = "DELETE FROM movies"
    SqlRunner.run(sql)
  end

  def delete_one()
    sql = "DELETE FROM movies WHERE id = $1"
    values = [@id]
    results = SqlRunner.run(sql, values)
  end

  def update()
    sql = "UPDATE movies SET (title, genre) = ($1, $2) WHERE id = $3"
    values = [@title, @genre, @id]
    results = SqlRunner.run(sql, values)
  end

  def stars()
    sql = "SELECT stars.* FROM stars
    INNER JOIN castings ON stars.id = castings.star_id
    WHERE castings.movie_id = $1"
    values = [@id]
    stars = SqlRunner.run(sql, values)
    return stars.map { |star| Star.new(star)  }
  end

  def remaining_budget()
   sql = "SELECT SUM(castings.fee) FROM castings WHERE castings.movie_id = $1"
   values = [@id]
   result = SqlRunner.run(sql, values).first
   return @budget - result['sum'].to_i
 end
end
