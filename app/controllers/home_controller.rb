class HomeController < ApplicationController
  def index
    @blog = Blog.where(name: 'landing').last||Blog.new({body:"Hello World, please create a new blog post named 'landing'"})
  end

  def dashboard
  end
end
