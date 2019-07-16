class HomeController < ApplicationController
  skip_before_action :authenticate_user!, :only => [:index]

  def index
    if current_user.present?
      if current_user.is_family
        @family = current_user.family
      end
    end
  end

end
