class PagesController < ApplicationController
  def get_random_joke
    Joke.find(:one, from: "/jokes/random")
  end
end
