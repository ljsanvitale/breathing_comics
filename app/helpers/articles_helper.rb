module ArticlesHelper

  def article_params
    params.require(:article).permit(:author_name, :title, :article_type,:body, :tag_list, :image)
  end

end
