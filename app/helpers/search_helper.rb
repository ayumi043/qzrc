module SearchHelper
  def hight_light(str,search_str)
    raw (sanitize str).gsub(/#{search_str}/, "<span style='color:#fff;background:yellow'>#{search_str}</span>")
  end
  def action_active(arg_action)
    action_name == arg_action ? " active" : ""
  end
end
