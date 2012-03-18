class StoreController < ApplicationController
  skip_before_filter :authorize
  
  def index
    @counter = acccess_counter
    if params[:set_locale]
      redirect_to store_path(locale: params[:set_locale])
    else
      @products = Product.order(:title)
      # @counter = acccess_counter
      @cart = current_cart
    end
  end

  def acccess_counter
    if session[:counter].nil?
      session[:counter] = 0
    end
      session[:counter] += 1
  end
  
end
