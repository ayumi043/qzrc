class Job < ActiveRecord::Base
  belongs_to :company
  acts_as_views_count :delay => 10

  # stringify_time :updated_at

  # def due_at_string
  #   due_at.to_s(:db)
  # end

  # def due_at_string=(due_at_str)
  #   self.due_at = Time.parse(due_at_str)
  # rescue ArgumentError
  #   @due_at_invalid = true
  # end

  # def validate
  #   errors.add(:updated_at, "is invalid") if @updated_at_invalid
  # end

  stringify_time :updated_at

  def validate
    binding.pry
    errors.add(:updated_at, "is invalid") if updated_at_invalid?
  end

  define_index do
    indexes name, :sortable => true
    indexes description, :sortable => true
  end
end