module ApplicationHelper
=begin
  def devise_mapping
    Devise.mappings[:squatter]
  end

  def resource_name
      devise_mapping.name
  end

  def resource_class
      devise_mapping.to
  end
=end
end
