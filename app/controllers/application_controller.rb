class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  require 'will_paginate/array'
  helper_method :mobile_device?

  def index
  end

  def check_for_mobile
  session[:mobile_override] = params[:mobile] if params[:mobile]
  prepare_for_mobile if mobile_device?
  end

  def mobile_device?
    if session[:mobile_override]
      session[:mobile_override] == "1"
    else
      # Season this regexp to taste. I prefer to treat iPad as non-mobile.
      (request.user_agent =~ /Mobile|webOS/) && (request.user_agent !~ /iPad/)
    end
  end

  def detect_device_variant
    request.variant = :phone if browser.device.mobile?
    prepare_for_mobile if browser.device.mobile?
  end

  def prepare_for_mobile
    new_path= Rails.root + 'app' + 'views/mobile'
    #raise new_path.to_s
    prepend_view_path new_path
    #raise Rails.root.to_s
  end

end
