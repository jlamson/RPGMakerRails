class PagesController < ApplicationController
  def get_random_joke
    Joke.find(:one, from: "/jokes/random")
  end

  def index
    @random_joke = get_random_joke
  end
end
