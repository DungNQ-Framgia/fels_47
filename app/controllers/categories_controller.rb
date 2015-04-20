class CategoriesController < ApplicationController
  def create
  end

  def show
  end

  def index
  	@categories = Category.paginate page: params[:page], per_page: Constant.categories_per_page
  end
end
