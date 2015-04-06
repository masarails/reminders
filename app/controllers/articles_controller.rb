class ArticlesController < ApplicationController
helper_method :current_user
before_action :authenticate_user!


def new
  end

def create 
  @article = Article.new(params.require(:article).permit(:title, :text))
 
  @article.save
  redirect_to @article
  end

def show
    @article = Article.find(params[:id])
  redirect_to articles_url 

end

def index

    @articles = Article.all
end  


def destroy
  @article = Article.destroy(params[:id])
   redirect_to @article
end


def edit 
    @article = Article.find(params[:id])
    @i_id = params[:id]
end

def update 
   allowed_params = params.require(:article).permit(:title, :text)
   article = Article.find(params[:id])
   article.update_attributes(allowed_params)
   redirect_to articles_url 
end



end 
