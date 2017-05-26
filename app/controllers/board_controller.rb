class BoardController < ApplicationController
  def index
    @posts = Post.all #controller에서 @ 붙은 변수들은 view 파일 에서도 사용 가능
    # @가 안붙은 변수들은 view에서 풀력을 안하거나 controller안에서 만 사용하거나
    # 한번쓰고 버리는 변수들 같은...
  end

  def create
    post = Post.new
    post.title = params[:title] #
    post.content = params[:content]
    if post.save
    #redirect_to:back
      redirect_to '/board/index'
    else
      render :text => post.errors.messages[:title].first
    end
  end

  def new
  end

  def update_view
    @one_post = Post.find(params[:id])
  end
  
  def real_update
    @some_post = Post.find(params[:update_id])
    @some_post.title=params[:update_title]
    @some_post.content = params[:update_content]
    @some_post.save
    redirect_to '/board/index'
    
  end
  

  def destroy
    @one_post = Post.find(params[:id])
    @one_post.destroy
    redirect_to '/board/index'
  end
end
