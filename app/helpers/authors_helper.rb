module AuthorsHelper

  def author_params
    params.require(:author).permit(:author_name, :description, :email, :twitter, :facebook,:body, :image)
  end
end
