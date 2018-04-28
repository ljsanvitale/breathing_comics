class Admin::AuthorsController < Admin::BaseController
include AuthorsHelper
  def index
    @authors=Author.all
  end

  def show
    @author = Author.find(params[:id])
  end

  def new
    @author = Author.new
  end
  def create
    @author = Author.new(author_params)

    @author.save
    flash.notice = "Author created!"
    redirect_to admin_author_path(@author)

  end
  def destroy
    @author = Author.find(params[:id])
    @author.destroy
  #  redirect_to :controller => 'article', :action => 'index'
    flash.notice = "Author deleted!"
    redirect_to(:action => :index)
  end
  def edit
    @author = Author.find(params[:id])
  end
  def update
    @author = Author.find(params[:id])
    @author.update(author_params)
    flash.notice = "Author '#{@author.author_name}' Updated!"
    redirect_to admin_author_path(@author)
  end
end
