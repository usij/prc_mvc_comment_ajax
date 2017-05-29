class PostsController < ApplicationController
    #CREATE
    def new
    #사용자가 데이터를 입력하면
    #자동으로 액션이름과 같은 화면을 보여서 사용자에게 보여줘라
    end
    def create
    #데이터를 실제 디비에 저장하는 액션
        @post=Post.new
        @post.title=params[:input_title]
        @post.content=params[:input_content]
        @post.save
        
        redirect_to "/posts/show/#{@post.id}"
    end
    #READ
    def index
    #모든 post들을 보여주는 View
        @posts=Post.all
    end
    def show
    #한개의 post를 보여주는 view
        @post = Post.find(params[:post_id])
        @comments = Comment.where(post_id: params[:post_id])
    end
    
    #UPDATE
    def edit
    #사용자가 db에 입력할 화면
        @post = Post.find(params[:post_id])
    end
    
    def update
    #데이터를 실제 디비에 저장하는 액션
        @post = Post.find(params[:post_id])
        #수정할코드
        @post.title=params[:input_title]
        @post.content=params[:input_content]
        @post.save
        redirect_to "/posts/show/#{@post.id}"
    end
    
    #DELETE
    def destroy
    #한개의 post를 삭제하는 액션
        @post = Post.find(params[:post_id])
        @post.destroy
        redirect_to '/'
    end
    
   
end
