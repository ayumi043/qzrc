class Job < ActiveRecord::Base
  belongs_to :company
  acts_as_views_count :delay => 10
end