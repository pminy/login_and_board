class BoardController < ApplicationController
  def index
    if user_signed_in?
      @posts = Post.all.reverse #controller에서 @ 붙은 변수들은 view 파일 에서도 사용 가능 reserve는 최근 글을 볼수 있도록 거기에 화면이 맞춰질수 있도록
    else
      redirect_to '/users/sign_in'
    end
    # @가 안붙은 변수들은 view에서 풀력을 안하거나 controller안에서 만 사용하거나
    # 한번쓰고 버리는 변수들 같은...
  end

  def create
    #post = Post.new
    #post.title = params[:title] #
    #post.content = params[:content]
    #post.user_id = current_user
    post =  Post.new(title: params[:title],
                     content: params[:reply_content],
                     user: current_user)
    #
    #
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
  
  #댓글 다는 부분 controller
  def reply_create 
    reply = Reply.new
    reply.content = params[:reply_content]
    reply.post_id = params[:id_of_post]
    reply.save
    redirect_to '/board/index'
  end
  
  
end
