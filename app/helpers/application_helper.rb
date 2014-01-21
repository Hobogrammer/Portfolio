module ApplicationHelper
  def flash_class(level)
    case level
      when :notice then "success"
      when :success then "success"
      when :error then "alert"
      when :alert then "alert"
    end
  end
end
