class ProfileController < ApplicationController

  def index
    @my_recipes = UserRecipe.where(user_id:current_user.id)
    @recipe_list = []
    @my_recipes.each do |favs|
      @recipe_list << Recipe.find(favs.recipe_id)
    end
  end


  def edit
    @profile = Profile.find(params[:id])
  end 
  def create
   @profile = Profile.new(profile_params)
   @profile.user_id = current_user.id
   if @profile.save
     redirect_to '/'
   else
     render 'new'
   end
 end

 def update
   @profile.update(profile_params)
   redirect_to '/profile'
 end

  private
     def set_profile
       @profile = Profile.find(params[:id])
     end

end
