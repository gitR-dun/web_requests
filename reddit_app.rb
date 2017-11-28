# get some data from the programming subreddit (use unirest)
require 'unirest'

response = Unirest.get("https://www.reddit.com/r/programming/.json")



# show some of that data to the user
  # show them the titles of the articles
  # show the user all the article titles (probably looping through an array somewhere)
articles = response.body['data']['children']

articles_length = articles.length

i = 0
articles_length.times do
  p "#{i}. #{articles[i]['data']['title']}"
  i += 1
end

# user picks an article
p "Choose an article"
index_of_article = gets.chomp.to_i

# I show the user the comments from that article

comments_link = articles[index_of_article]['data']['permalink']

comments_response = Unirest.get("https://www.reddit.com#{comments_link}.json")

comments = comments_response.body[1]['data']['children']

comments.each do |comment|
  p comment['data']['body']
end
