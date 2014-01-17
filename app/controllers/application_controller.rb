class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_action :set_locale
    
    def set_locale
      I18n.locale = params[:locale] || I18n.default_locale
    end

    def default_url_options(options={})
      logger.debug "default_url_options is passed options: #{options.inspect}\n"
      { locale: I18n.locale }
    end

  private

  	def current_cart
  		Cart.find(session[:cart_id])
  	rescue ActiveRecord::RecordNotFound
  		cart = Cart.create
  		session[:cart_id] = cart.id 
  		cart 
  	end

end
