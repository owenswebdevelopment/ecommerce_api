require "json"
require "open-uri"

class Api::ProductsController < ApplicationController

  def index
    products = Products.all
    render json: products
  end
end
