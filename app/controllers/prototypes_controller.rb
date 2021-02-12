class PrototypesController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :move_to_index, only: [:edit, :update, :destroy]

  def index
    @prototypes = Prototype.all
  end

  def new
    @prototype = Prototype.new
  end

  def create
    @prototype = Prototype.create(prototype_params)
    if @prototype.save
      redirect_to prototypes_path
    else
      render :new
    end
  end

  def show
    @prototype = Prototype.find(params[:id])
    @comment = Comment.new
    @comments = @prototype.comments.includes(:user)
  end

  def edit
    
  end

  def update
    prototype = Prototype.find(params[:id])
    if prototype.update(prototype_params)
      redirect_to prototype_path, method: :get
    else
      render :edit
    end
  end

  def destroy
    prototype = Prototype.find(params[:id])
    prototype.destroy
    redirect_to root_path
  end


  private
  def move_to_index
    @prototype = Prototype.find(params[:id])
    unless @prototype.user.id == current_user.id
      redirect_to action: :index
    end
  end



  def prototype_params
    params.require(:prototype).permit(:name, :image, :text, :title, :concept, :catch_copy).merge(user_id: current_user.id)
  end
end
