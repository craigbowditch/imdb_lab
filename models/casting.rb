require_relative('../db/sql_runner')

class Casting

  attr_reader :id, :movie_id, :star_id
  attr_accessor :fee

  def initialize(options)
    @id = options['id'].to_i() if options['id']
    @movie_id = options['movie_id'].to_i()
    @star_id = options['star_id'].to_i()
    @fee = options['fee'].to_i()
  end

  def save()
    sql = "INSERT INTO castings
    (
    movie_id, star_id, fee
     )
    VALUES ($1, $2, $3)
    RETURNING id"
    values = [@movie_id, @star_id, @fee]
    results = SqlRunner.run(sql, values).first
    @id = results['id'].to_i()
  end

  def self.all()
    sql = "SELECT * FROM castings"
    castings = SqlRunner.run(sql)
    results = castings.map { |casting| Casting.new(casting)  }
    return results
  end

  def self.delete_all()
    sql = "DELETE FROM castings"
    results = SqlRunner.run(sql)
  end

  def delete_one()
    sql = "DELETE FROM castings WHERE id = $1"
    values = [@id]
    results = SqlRunner.run(sql,values)
  end

    def update()
      sql = "UPDATE castings SET fee = $1 WHERE id = $2"
      values = [@fee, @id]
      results = SqlRunner.run(sql, values)
    end
end
