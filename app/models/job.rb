class Job < ActiveRecord::Base
  belongs_to :company
  acts_as_views_count :delay => 10

  # stringify_time :updated_at

  def validate
    errors.add(:updated_at, "is invalid") if @updated_at_invalid
  end

  define_index do
    indexes name, :sortable => true
    indexes description, :sortable => true
  end
end