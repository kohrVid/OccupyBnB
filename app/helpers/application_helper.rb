module ApplicationHelper
  def front_page_images
    [{ url: image_url("abode.jpg"), slogan: "Looking for a new place to live for free?"  },
     { url: image_url("abode2.jpg"), slogan: "Occupy your dream abode today!" }]
  end
end
