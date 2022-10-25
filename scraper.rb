require 'open-uri'
require 'nokogiri'

def top_five_movies
  url = "https://www.imdb.com/chart/top"
  html_file = URI.open(url).read
  html_doc = Nokogiri::HTML(html_file)
  movies = html_doc.search(".titleColumn > a").first(5)
  movies.map do |movie|
    "https://www.imdb.com#{movie.attr("href")}"
  end
end

def movie_info(movie_url)
  url = movie_url
  html_file = URI.open(url, "Accept-Language" => "en-US").read
  doc = Nokogiri::HTML(html_file)

  title = doc.search("h1").text
  year = doc.at(".sc-8c396aa2-2").text.to_i
  storyline = doc.search(".sc-16ede01-1").text
  director = doc.at(".ipc-metadata-list-item__list-content-item.ipc-metadata-list-item__list-content-item--link").text
  cast = doc.search(".ipc-metadata-list__item:contains('Stars') .ipc-metadata-list-item__list-content-item").map(&:text).uniq

  {
    cast: cast,
    director: director,
    storyline: storyline,
    title: title,
    year: year
  }
end
