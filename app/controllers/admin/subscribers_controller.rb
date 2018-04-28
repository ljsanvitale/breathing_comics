class Admin::SubscribersController < Admin::BaseController
include SubscribersHelper

  def index
    @subscribers=Subscriber.all
  end

  # GET /users/1
  # GET /users/1.json
  def show
    @subscriber = Subscriber.find(params[:id])
  end

  # GET /users/new
  def new

  end

  # GET /users/1/edit
  def edit
        @subscriber = Subscriber.find(params[:id])
  end

  # POST /users
  # POST /users.json
  def create
    @subscriber = Subscriber.new(subscriber_params)

    respond_to do |format|
      if @subscriber.save
        format.html { redirect_to root_path, notice: 'Thank You For Subscribing!' }
        format.json { render :show, Subscribe.create(subscriber_params)}
      else
        format.html  { redirect_to root_path, notice: 'There was a problem with the subscription' }
        format.json  { render :json => @subscriber.errors, :status => :unprocessable_entity }
      end
    end
  end

end
