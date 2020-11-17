class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home, :users]
  def home
    redirect_to users_path
  end
end
