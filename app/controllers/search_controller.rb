class SearchController < ApplicationController
  def index
    # pry

    # @tasks = Task.find(:all, :conditions=> [ "name LIKE ?", "%#{params[:query]}%" ]
      
    @jobs = Job.where("name like ? ","%#{params[:search_txt]}%")
               .includes(:company)
               .page(params[:page]).per(15)

    # @jobs = Job.search params[:search_txt],
    #     :field_weights => {:name => 20},
    #     :include => :company,
    #     :match_mode => :boolean,
    #     :order => :name,
    #     :sort_mode => :desc,
    #     :page => (params[:page] || 1),
    #     :per_page => 15

    #render 'jobs/index'
  end

  def company
    @companys = Company.where("name like ? ","%#{params[:search_txt]}%")
                       .page(params[:page]).per(30)

    @top_jobs = Job.all(:conditions => ['views_count > 0'],
                        :order => ['views_count DESC'],
                        :limit => 5).uniq                   
  end

end
