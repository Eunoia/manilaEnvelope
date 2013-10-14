class HomeController < ApplicationController
  def index
    @blog = Blog.where(name: 'landing').last
  end

  def dashboard
  end
end
