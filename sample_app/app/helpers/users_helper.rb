module UsersHelper

  def profile_image_for(user, options = { size: 80 })
    if user.profile_image?
      image_tag(user.profile_image, size: options[:size])
    else
      fa_icon "user", class: "fa-3x"
    end
  end

  def gravatar_for(user, options = { size: 80 })
    gravatar_id = Digest::MD5::hexdigest(user.email.downcase)
    size = options[:size]
    gravatar_url = "https://secure.gravatar.com/avatar/#{gravatar_id}?s=#{size}"
    image_tag(gravatar_url, alt: user.name, class: "gravatar")
  end
end
