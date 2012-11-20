class SearchController < ApplicationController
  def index
    # pry
    @jobs = Job.where("name like ? ","%#{params[:search_txt]}%")
               .includes(:company)
               .page(params[:page]).per(30)

    @top_jobs = Job.all(:conditions => ['visit > 0'],
                        :order => ['visit DESC'],
                        :limit => 5).uniq
               
    #render 'jobs/index'
  end

  def company
    @companys = Company.where("name like ? ","%#{params[:search_txt]}%")
                       .page(params[:page]).per(30)

    @top_jobs = Job.all(:conditions => ['visit > 0'],
                        :order => ['visit DESC'],
                        :limit => 5).uniq                   
  end

end
