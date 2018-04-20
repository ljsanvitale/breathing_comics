class PagesController < ApplicationController

  def index
    @main_articles=Article.take(7)
    #@articles_list=Article.all(:limit => 5, :offset => 5)
  end

end
