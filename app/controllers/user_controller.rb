class UsersController < ApplicationController
  
    def index
      @users = User.all
    end
    
    def show
      @user = User.find_by(id: params[:id])
    end
    
    def new
      @user = User.new
    end
    
    def create
      @user = User.new(
        name: params[:name],
        email: params[:email],
        image_name: "default_user.jpg"
      )
      if @user.save
        flash[:notice] = "ユーザー登録が完了しました"
        redirect_to("/users/#{@user.id}")
      else
        render("users/new")
      end
    end
    
    def edit
      @user = User.find_by(id: params[:id])
    end
    
    def update
      @user = User.find_by(id: params[:id])
      @user.name = params[:name]
      @user.email = params[:email]
      
      if params[:image]
        @user.image_name = "#{@user.id}.jpg"
        image = params[:image]
        File.binwrite("public/user_images/#{@user.image_name}", image.read)
      end
      
      if @user.save
        flash[:notice] = "ユーザー情報を編集しました"
        redirect_to("/users/#{@user.id}")
      else
        render("users/edit")
      end
    end
    
    def login_form
    end
    
    def login
      # 入力内容と一致するユーザーを取得し、変数@userに代入してください
      @user = User.find_by(email: params[:email], password: params[:password])
      # @userが存在するかどうかを判定するif文を作成してください
      if @user
        flash[:notice] = "ログインしました"
        redirect_to("/posts/index")
      else
        render("users/login_form")
      end
    end
    
  end
  