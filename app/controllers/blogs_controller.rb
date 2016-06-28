class BlogsController < ApplicationController
  
  helper_method :recent_blogs, :comments

  def index
  end

  def show
  end


  protected

  def recent_blogs
    Blog.recent
  end

  def blog
    Blog.find_by_permalink(params[:id])
  end

  def comments
    blog.comments
  end

end
