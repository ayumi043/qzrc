class CompanysController < ApplicationController

  def index
    @companys = Company.page(params[:page]).per(15)
    # @companys = Company.all
  end	

  def show
    @company = Company.find(params[:id])
  end	

  

end
