class HomeController < ApplicationController
  def index
    @default_store = Store.first
  end
end
