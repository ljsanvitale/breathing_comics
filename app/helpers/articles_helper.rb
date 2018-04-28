module ArticlesHelper

  def article_params
    params.require(:article).permit(:author_name, :title, :subtitle, :author, :article_type,:body, :tag_list, :image, :main_image,:author_id)
  end

end
