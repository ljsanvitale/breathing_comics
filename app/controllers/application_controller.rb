class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  require 'will_paginate/array'
  
  def index
  end

  def detect_device_variant
    request.variant = :phone if browser.device.mobile?
  end

end
