class PagesController < ApplicationController
before_action :detect_device_variant, :only => :show

  def index
    @main_four_articles=Article.article_list.take(4)
    @review_articles=Article.article_reviews.take(3)
    @articles_list=Article.article_list.all_except(@main_four_articles).paginate(:page => params[:page],:per_page => 5 )
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
    @most_read  = Article.all_except(@article).order('count_views DESC').limit(5)
    @subscriber = Subscriber.new
  end

  def tag_page
    @tag=Tag.find(params[:tag])
    @articles= @tag.articles.paginate(:page => params[:page],:per_page => 5 )
    respond_to do |format|
      format.html
      format.js
    end
  end

  def author_page
    @author=Author.find(params[:author])
    @articles= @author.articles.paginate(:page => params[:page],:per_page => 5 )
    respond_to do |format|
      format.html
      format.js
    end
  end

end
