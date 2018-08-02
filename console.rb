require_relative('models/movie.rb')
require_relative('models/star.rb')
require_relative('models/casting')
require_relative('db/sql_runner')
require ('pry')

Casting.delete_all()
Star.delete_all()
Movie.delete_all()

movie1 = Movie.new(
  {'title' => "The Royal Tenenbaums",
  'genre' => "Wes Anderson weirdness"})
movie1.save()

 star1 = Star.new (
  {
    'first_name' => "Ben",
    'last_name' => "Stiller"
    })
    star1.save()

  casting1 = Casting.new(
    {
      "movie_id" => movie1.id,
      "star_id" => star1.id,
      "fee" => "500"
    }
  )
  casting1.save()

binding.pry
nil
