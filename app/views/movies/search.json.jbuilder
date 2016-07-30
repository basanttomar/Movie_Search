json.array!(@movies) do |movie|
  json.name        movie.name
  json.language     movie.language
  json.country    movie.country
end
