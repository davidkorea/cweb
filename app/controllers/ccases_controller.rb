class CcasesController < ApplicationController

  before_action :authenticate_user! , only: [:new, :create, :sdit, :update, :destroy]



  def index
    @ccases = Ccase.all.recent.paginate(:page => params[:page], :per_page => 15)
  end

  def show
    @ccase = Ccase.find(params[:id])
    @posts = @ccase.posts.recent
  end

  def new
    @ccase = Ccase.new
  end


  def create
    @ccase = Ccase.new(ccase_params)
    @ccase.user = current_user

    if @ccase.save
      redirect_to ccases_path
    else
      render :new
    end
  end


  def edit
    @ccase = Ccase.find(params[:id])
  end

  def update
    @ccase = Ccase.find(params[:id])
    if @ccase.update(ccase_params)
      redirect_to ccases_path
      flash[:notice] = "Updated"
    else
      render :edit
    end
  end

  def destroy
    @ccase = Ccase.find(params[:id])
    @ccase.destroy
    flash[:alert] = "Deleted"
    redirect_to ccases_path
  end




  private

  def ccase_params
    params.require(:ccase).permit(:title, :description, :device, :custname, :custsite, :custphone, :custmail, :note)
  end






















end
