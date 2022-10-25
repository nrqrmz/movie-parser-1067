require_relative '../scraper'

describe "#top_five_movies" do
  it "returns an array of movies" do
    urls = top_five_movies
    expected = [
      "https://www.imdb.com/title/tt0111161/", # Notice we don't need the query string.
      "https://www.imdb.com/title/tt0068646/",
      "https://www.imdb.com/title/tt0468569/",
      "https://www.imdb.com/title/tt0071562/",
      "https://www.imdb.com/title/tt0050083/"
    ]
    expect(urls).to eq(expected)
  end
end

describe "#movie_info" do
  it "returns a Hash describing a movie" do
    the_dark_knight_url = "https://www.imdb.com/title/tt0468569/"
    movie = movie_info(the_dark_knight_url)

    expected = {
      cast: [ "Christian Bale", "Heath Ledger", "Aaron Eckhart" ],
      director: "Christopher Nolan",
      storyline: "When the menace known as the Joker wreaks havoc and chaos on the people of Gotham, Batman must accept one of the greatest psychological and physical tests of his ability to fight injustice.",
      title: "The Dark Knight",
      year: 2008
    }
    expect(movie).to eq(expected)
  end
end
