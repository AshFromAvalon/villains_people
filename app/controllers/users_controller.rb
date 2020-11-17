class UsersController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]
  def show
    @user = User.find(params[:id])
  end

  def index
    #if the user has filtered
    if params[:query]
      #params[:query] is an array of crimes selected via checkboxes
      params[:query].each_with_index do |crime, index|
        if index == 0
          #to instantiate an active record collection
          @users = User.includes(:crimes).where('crimes.category' => crime)
        else
          #adds other crimes selected to the collection
          @users.merge(User.includes(:crimes).where('crimes.category' => crime))
        end
      end
    else
      @users =  User.includes(:crimes).where.not('crimes.id' => nil)
    end
  end

  def filter_index
    #isolate params that are in our crimes list
    selected_crimes = params.keys.select { |crime| Crime::CATEGORIES.include?(crime) }
    redirect_to action: "index", query: selected_crimes
  end
end
