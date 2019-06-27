class PostsController < ApplicationController
  def index
    @tweets = Tweet.recent
  end
end
