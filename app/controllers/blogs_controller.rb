class BlogsController < ApplicationController
  
  helper_method :recent_blogs, :comments, :blog

  def index
  end

  def show
  end

  def create
    @blog = Blog.create(blog_params)
    @blog.comments.refresh
    redirect_to blog_url @blog
  end


  protected

  def recent_blogs
    Blog.recent
  end

  def blog
    if params[:id]
      Blog.find_by(permalink: params[:id])
    else
      Blog.new
    end
  end

  def comments
    binding.pry
    blog.comments
  end

  def blog_params
    params.require(:blog).permit(:title, :comments_feed_url)
  end

end
