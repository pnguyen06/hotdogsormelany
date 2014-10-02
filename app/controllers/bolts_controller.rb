class BoltsController < ApplicationController
  before_action :set_bolt, only: [:show, :edit, :update, :destroy]
  before_action :correct_user, only: [:edit, :update, :destroy]
  before_action :authenticate_user!, except: [:index, :show]


  def index
    @user = current_user
    @bolts = Bolt.all
  end

  def show
    @user = current_user
  end

  def new
    @user = current_user
    @bolt = current_user.bolts.build 
  end

  def edit
    @user = current_user
  end

  def create
    @bolt = current_user.bolts.build(bolt_params)
    if @bolt.save
      redirect_to @bolt, notice: 'Bolt was successfully created.'
    else
      render action: 'new'
    end
  end

  def update
    if @bolt.update(bolt_params)
      redirect_to @bolt, notice: 'Bolt was successfully updated.'
    else
      render action: 'edit'
    end
  end

  def destroy
    @bolt.destroy
    redirect_to bolts_url
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_bolt
      @bolt = Bolt.find(params[:id])
    end

    def correct_user
      @bolt = current_user.bolts.find_by(id: params[:id])
      redirect_to bolts_path, notice: "Not authorized to edit this bolt" if @bolt.nil?
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def bolt_params
      params.require(:bolt).permit(:description, :image)
    end
end