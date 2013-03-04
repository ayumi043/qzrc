class JobsController < ApplicationController
  # caches_page :index
  def index
    # @listings = Listing.page(params[:page]).per(params[:page].to_i == 1 ? 100 : 25)
    @jobs = Job.includes(:company).page(params[:page]).per(15)
    #   binding.pry 
    @top_jobs = Job.all(:conditions => ['views_count > 0'],
                        :order => ['views_count DESC'],
                        :limit => 5).uniq
  end 

  def show
    @job = Job.find(params[:id])

    # update views_count
    @job.update_views_count

    # @job.visit = @job.visit + 1
    # @job.save!
  end 
end
