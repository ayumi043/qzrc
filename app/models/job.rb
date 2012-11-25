class Job < ActiveRecord::Base
  belongs_to :company
  acts_as_views_count :delay => 10

  define_index do
    indexes name, :sortable => true
    indexes description, :sortable => true
  end
end