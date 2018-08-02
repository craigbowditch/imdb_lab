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
    'genre' => "Wes Anderson weirdness",
    'budget' => 2000
  })
    movie1.save()

movie2 = Movie.new(
  {
    'title' => "Pulp Fiction",
    'genre' => "Tarantino weirdness",
    'budget' => 5000
    })
    movie2.save()
    star1 = Star.new (
      {
        'first_name' => "Ben",
        'last_name' => "Stiller"
        })
        star1.save()

        star2 = Star.new (
          {
            'first_name' => "Gwyneth",
            'last_name' => "Paltrow"
            })
            star2.save()

            star3 = Star.new (
              {
                'first_name' => "Samuel L",
                'last_name' => "Jackson"
                })
                star3.save()

                casting1 = Casting.new(
                  {
                    "movie_id" => movie1.id,
                    "star_id" => star1.id,
                    "fee" => 500
                  }
                )
                casting1.save()

                casting2 = Casting.new(
                  {
                    'movie_id' => movie1.id,
                    'star_id' => star2.id,
                    "fee" => 600
                    })
                    casting2.save()

                    casting3 = Casting.new(
                      {
                        'movie_id' => movie2.id,
                        'star_id' => star3.id,
                        "fee" => 1000
                        })
                        casting3.save()
                        binding.pry
                        nil
