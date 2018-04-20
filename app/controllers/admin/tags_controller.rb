class Admin::TagsController < Admin::BaseController

  def index
    @tags=Tag.all
  end

  def show
    @tag = Tag.find(params[:id])
  end
end
