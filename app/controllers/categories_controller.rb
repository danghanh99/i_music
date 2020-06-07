class CategoriesController < ApplicationController
  def new
    @category = Category.new()
  end

  def create
    @category = current_user.categories.build(category_params)
    if @category.save
      flash[:success] = "category created!"
      redirect_to user_path(current_user)
    else
      @user = current_user
      @categories = Category.all
      render "users/show"
    end
  end

  private

  def category_params
    params.require(:category).permit(:name)
  end

end
