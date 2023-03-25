class ApplicationController < ActionController::Base

  before_action :set_render_cart
  before_action :initialize_cart
  before_action :set_query


  def set_query
    @query = Product.ransack(params[:q])

  end

  def set_render_cart
    @render_cart = true
  end

  def initialize_cart
    @cart ||= Cart.find_by(id: session[:cart_id])

    if @cart.nil?
      @cart = Cart.create
      session[:cart_id] = @cart.id
    end
  end

end
