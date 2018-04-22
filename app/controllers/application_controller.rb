class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  require 'will_paginate/array'

  def index
  end
end
