class PagesController < ApplicationController
before_action :check_for_mobile, :only => :show

  def index
    #@main_articles=Article.take(7)
    @main_four_articles=Article.main_articles.take(4)
    @review_articles=Article.article_reviews.take(3)
    @articles_list=Article.article_list.paginate(:page => params[:page],:per_page => 5 )
    @subscriber = Subscriber.new
    respond_to do |format|
      format.html
      format.js
    end

  end

  def show
    @article = Article.find(params[:id])
    @article.count_views=@article.count_views+1
    @article.save
    @comment = Comment.new
    @comment.article_id = @article.id
    @most_read = Article.order('count_views DESC').limit(5)
    @most_read  = Article.all_except(@article).order('count_views DESC').limit(5)
    @subscriber = Subscriber.new
  end

  def tag_page
    @tag=Tag.find(params[:tag])
    @articles= @tag.articles.paginate(:page => params[:page],:per_page => 5 )
  end

  def author_page
    @author=Author.find(params[:author])
    @articles= @author.articles.paginate(:page => params[:page],:per_page => 5 )
  end

end
