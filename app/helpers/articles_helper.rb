module ArticlesHelper

  def article_params
    params.require(:article).permit(:author_name, :title, :subtitle, :author, :article_type,:story_by, :art_by,:number_pages,:publisher, :published_at,:cover_price,:url,:body, :tag_list, :image, :main_image,:author_id)
  end

end
