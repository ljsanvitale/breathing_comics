class Admin::ArticlesController < Admin::BaseController
  include ArticlesHelper

  def index
    @articles=Article.all.paginate(:page => params[:page],:per_page => 40 )
  end

  def show
    @article = Article.find_by_article_slug(params[:id])
    @comment = Comment.new
    @comment.article_id = @article.id

  end
  def new
    @article = Article.new
  end
  def create
    @article = Article.new(article_params)
    @article.save
    flash.notice = "Article created!"
    redirect_to admin_article_path(@article)

  end
  def destroy
    @article = Article.find_by_article_slug(params[:id])
    @article.destroy
  #  redirect_to :controller => 'article', :action => 'index'
    flash.notice = "Article deleted!"
    redirect_to(:action => :index)
  end
  def edit
    @article = Article.find_by_article_slug(params[:id])
  end
  def update
    @article = Article.find_by_article_slug(params[:id])
    @article.update(article_params)
    flash.notice = "Article '#{@article.title}' Updated!"
    redirect_to admin_article_path(@article)
  end

  def articles_filtered
    case params[:art_type]
    when 'reviews'
      @articles=Article.admin_article_reviews.paginate(:page => params[:page],:per_page => 40 )
    when 'previews'
      @articles=Article.admin_article_previews.paginate(:page => params[:page],:per_page => 40 )
    when 'news'
      @articles=Article.admin_article_news.paginate(:page => params[:page],:per_page => 40 )
    when 'notes'
      @articles=Article.admin_article_notes.paginate(:page => params[:page],:per_page => 40 )
    else
      @articles=Article.all.paginate(:page => params[:page],:per_page => 40 )
    end
  end

end
