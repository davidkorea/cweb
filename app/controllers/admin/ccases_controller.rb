class Admin::CcasesController < ApplicationController

   before_action :authenticate_user!, only: [:new, :create, :update, :edit, :destroy]
   before_action :require_is_admin


   def index
     @ccases = Ccase.all
   end

   def show
     @ccase = Ccase.find(params[:id])
   end

   def new
     @ccase = Ccase.new
   end

   def create
     @ccase = Ccase.new(ccase_params)
     if @ccase.save
       redirect_to admin_ccases_path
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
       redirect_to admin_ccases_path
       flash[:notice] = "Updated"
     else
       render :edit
     end
   end

    def destroy
      @ccase = Ccase.find(params[:id])
      @ccase.destroy
      redirect_to admin_ccases_path
      flash[:alert] = "Deleted"
    end















    private

    def ccase_params
      params.require(:ccase).permit(:title, :description, :device, :custname, :custsite, :custphone, :custmail, :note)
   end
end
