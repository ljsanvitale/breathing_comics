class PagesController < ApplicationController

  def index
    #@main_articles=Article.take(7)
    @main_articles=Article.main_articles
    @articles_list=Article.article_list.paginate(:page => params[:page],:per_page => 5 )
  end

end
