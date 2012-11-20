module ApplicationHelper
  def current_class(arg_controller_name)
    'class=active' if controller_name == arg_controller_name
  end
end