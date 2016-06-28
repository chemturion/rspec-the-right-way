class BlogsController < ApplicationController
  def index
  end

  helper_method :recent_blogs

  protected

  def recent_blogs
    Blog.recent
  end
end
