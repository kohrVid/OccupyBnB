module ApplicationHelper
  def front_page_images
    [{ url: AbodeImage.first.file_name.url, slogan: "Looking for a new place to live for free?"  },
     { url: AbodeImage.second.file_name.url, slogan: "Occupy your dream abode today!" }]
  end
end
