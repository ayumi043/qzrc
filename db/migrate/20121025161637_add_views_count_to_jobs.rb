class AddViewsCountToJobs < ActiveRecord::Migration
  def change
    add_column :jobs, :views_count, :integer, :default => 0
  end
end
