class WelcomeController < ApplicationController
  def index
    @latestArticles = Article.order("created_at").last(4)
  end
end
