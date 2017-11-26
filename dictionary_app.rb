require 'unirest'

while true



  system "clear"
  p "Enter the word you want to know about"
  user_word = gets.chomp

  if user_word == 'q'
    p 'Thanks for using my app'
    break
  end

  definition_response = Unirest.get("http://api.wordnik.com/v4/word.json/#{user_word}/definitions?limit=200&includeRelated=true&useCanonical=false&includeTags=false&api_key=a2a73e7b926c924fad7001ca3111acd55af2ffabf50eb4ae5")

  text = definition_response.body[0]['text']

  example_response = Unirest.get("http://api.wordnik.com:80/v4/word.json/#{user_word}/topExample?useCanonical=false&api_key=a2a73e7b926c924fad7001ca3111acd55af2ffabf50eb4ae5
  ")

  example = example_response.body['text']


  pronunciation_response = Unirest.get("http://api.wordnik.com:80/v4/word.json/#{user_word}/pronunciations?useCanonical=false&limit=50&api_key=a2a73e7b926c924fad7001ca3111acd55af2ffabf50eb4ae5
  ")

  pronunciation = pronunciation_response.body[0]['raw']


  p "You typed in #{user_word} which has the definition of #{text}. An example of this word would be #{example} and it is pronounced #{pronunciation}"

end
