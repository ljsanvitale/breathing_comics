class PagesController < ApplicationController
before_action :detect_device_variant, :only => [:index, :show, :tag_page, :author_page,:news_page, :articles_page,:previews_page, :reviews_page]

  def index
    @main_four_articles=Article.article_list.take(4)
    @review_articles=Article.article_reviews.take(3)
    @articles_list=Article.article_list.all_except(@main_four_articles).paginate(:page => params[:page],:per_page => 5 )
    @subscriber = Subscriber.new
    if request.variant.phone?
      @mobile = true
    else
      @mobile = false
    end
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
    @most_read  = Article.article_list.all_except(@article).reorder(count_views: :desc).limit(5)
    @subscriber = Subscriber.new
    @head_title = @article.title
  end

  def tag_page
    @tag=Tag.find(params[:tag])
    @articles= @tag.articles.paginate(:page => params[:page],:per_page => 5 )
    @head_title = @tag.name + " | Breathing Comics"
    if request.variant.phone?
      @mobile = 'col-xs-12'
    else
      @mobile = 'col-xs-8'
    end
    respond_to do |format|
      format.html
      format.js
    end
  end

  def author_page
    @author=Author.find(params[:author])
    @head_title = @author.author_name + " | Breathing Comics"
    @articles= @author.articles.paginate(:page => params[:page],:per_page => 5 )
    if request.variant.phone?
      @mobile = 'col-xs-12'
    else
      @mobile = 'col-xs-8'
    end
    respond_to do |format|
      format.html
      format.js
    end
  end

  def news_page
    @articles= Article.article_news.paginate(:page => params[:page],:per_page => 5 )
    @head_title = "Comic News | Breathing Comics"
    if request.variant.phone?
      @mobile = 'col-xs-12'
    else
      @mobile = 'col-xs-8'
    end
    respond_to do |format|
      format.html
      format.js
    end
  end

  def reviews_page
    @articles= Article.article_reviews.paginate(:page => params[:page],:per_page => 12 )
    @head_title = "Comic Reviews | Breathing Comics"
    if request.variant.phone?
      @mobile = 'col-xs-6'
      @mobile_main = 'col-xs-12'
    else
      @mobile = 'col-xs-3'
      @mobile_main = 'col-xs-8'
    end
    respond_to do |format|
      format.html
      format.js
    end
  end

  def previews_page
    @articles= Article.article_previews.paginate(:page => params[:page],:per_page => 12 )
    @head_title = "Comic Previews | Breathing Comics"
    if request.variant.phone?
      @mobile = 'col-xs-6'
      @mobile_main = 'col-xs-12'
    else
      @mobile = 'col-xs-3'
      @mobile_main = 'col-xs-8'
    end
    respond_to do |format|
      format.html
      format.js
    end
  end

  def articles_page
    @articles= Article.article_notes.paginate(:page => params[:page],:per_page => 5 )
    @head_title = "Comic Articles | Breathing Comics"
    if request.variant.phone?
      @mobile = 'col-xs-12'
    else
      @mobile = 'col-xs-8'
    end
    respond_to do |format|
      format.html
      format.js
    end
  end
end
