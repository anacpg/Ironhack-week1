


imdb = Imdb.new
i = imdb.Movie.new("0095016")

i.title
#=> "Die Hard"

i.cast_members.first
#=> "Bruce Willis"