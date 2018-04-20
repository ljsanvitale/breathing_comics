module ArticlesHelper

  def article_params
    params.require(:article).permit(:author_name, :title, :body, :tag_list, :image)
  end

end
