require_relative('models/movie.rb')
require_relative('db/sql_runner')
require ('pry')

movie1 = Movie.new(
  {'title' => "The Royal Tenenbaums",
  'genre' => "Wes Anderson weirdness"})
movie1.save()

binding.pry
nil
