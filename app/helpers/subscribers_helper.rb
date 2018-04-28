module SubscribersHelper
  def subscriber_params
    params.require(:subscriber).permit(:email)
  end

end
