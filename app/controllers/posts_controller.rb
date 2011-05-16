class PostsController < ApplicationController
  def index
    response.headers['Cache-Control'] = 'public, max-age=600'
    @tag = params[:tag]
    @posts = Post.find_recent(:tag => @tag, :include => :tags)

    respond_to do |format|
      format.html
      format.atom { render :layout => false }
    end
  end

  def show
    response.headers['Cache-Control'] = 'public, max-age=600'
    @post = Post.find_by_permalink(*([:year, :month, :day, :slug].collect {|x| params[x] } << {:include => [:approved_comments, :tags]}))
    @comment = Comment.new
  end
end
