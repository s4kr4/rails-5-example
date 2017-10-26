module UsersHelper

  def profile_image_for(user, options = { size: 80 })
    if user.profile_image?
      image_tag(user.profile_image, size: options[:size])
    else
      fa_icon "user", class: "fa-3x"
    end
  end

end
