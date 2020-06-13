class CategoriesController < ApplicationController
  def new
    @category = Category.new()
  end

  def show
    @category = Category.find(params[:id])
  end

  def index 
    @categories = Category.all
  end
  
  def create
    @category = current_user.categories.build(category_params) if admin?
    if @category.save
      flash[:success] = "Category created!"
      redirect_to category_path(@category)
    else
      @user = current_user
      @categories = Category.all
      render "users/show"
    end
  end

  def destroy
    @category = Category.find(params[:id])
    @category.destroy
    flash[:success] = "Category deleted"
    redirect_to current_user
  end

  def edit
    @category = Category.find(params[:id])
  end

  def update
    @category = Category.find(params[:id])
    if @category.update_attributes(category_params)
      flash[:success] = "Category updated"
      redirect_to category_path(@category)
    else
      render "edit"
    end
  end
  private

  def category_params
    params.require(:category).permit(:name)
  end

end
