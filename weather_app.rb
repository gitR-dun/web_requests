require 'unirest'

p 'What city do you want the weather from?'
user_city = gets.chomp

p 'What state do you want the weather from?'
user_state = gets.chomp

response = Unirest.get("https://query.yahooapis.com/v1/public/yql?q=select%20*%20from%20weather.forecast%20where%20woeid%20in%20(select%20woeid%20from%20geo.places(1)%20where%20text%3D%22#{user_city}%2C%20#{user_state}%22)&format=json&env=store%3A%2F%2Fdatatables.org%2Falltableswithkeys")

weather_data = response.body
# temp
temperature = weather_data['query']['results']['channel']['item']['condition']['temp']

# condition
condition = weather_data['query']['results']['channel']['item']['condition']['text']


# city

city = weather_data['query']['results']['channel']['location']['city']


p "It is currently #{temperature} degrees and #{condition.downcase} in #{city}"




