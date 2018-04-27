class PagesController < ApplicationController

  def index
    #@main_articles=Article.take(7)
    @main_four_articles=Article.main_articles.take(4)
    @main_articles=Article.main_articles.drop(4)
    @articles_list=Article.article_list.paginate(:page => params[:page],:per_page => 5 )
  end

  def show
    @article = Article.find(params[:id])
    @article.count_views=@article.count_views+1
    @article.save
    @comment = Comment.new
    @comment.article_id = @article.id
    @most_read = Article.order('count_views DESC').limit(5)
    if @most_read.include?(@article)
      @most_read << @article
    end
  end

end
