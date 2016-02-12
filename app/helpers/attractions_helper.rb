module AttractionsHelper

  def show_link_message(attraction)
    if @user.admin?
      "Show #{attraction.name}"
    else
      "Go on #{attraction.name}"
    end
  end

end
