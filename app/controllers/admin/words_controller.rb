class Admin::WordsController < ApplicationController
  layout "admin/admin"
  before_action :logged_in_user
  before_action :admin_user
  before_action :category

  def index
    @words = Word.paginate page: params[:page], per_page: 5
  end

  def new
    @word = Word.new
    4.times {@word.answers.build}
  end

  def create
    @word = @category.words.build words_params
    if @word.save
      flash[:success] = "Created success"
      redirect_to [:admin, :category, :words]
    else
      render :new
    end
  end

  def update
    @word = Word.find params[:id]
    if @word.update words_params
      flash[:success] = "Updated success"
      redirect_to [:admin, :category, :words]
    else
      render :edit
    end
  end

  def edit
    @word = Word.find params[:id]
    @word.category = @category
  end

  def destroy
    @word = Word.find params[:id]
    @word.destroy
    flash[:success] = "Deleted success"
    redirect_to [:admin, :category, :words]
  end

  private
  def words_params
    params.require(:word).permit :text,
      answers_attributes: [:id, :text, :correct]
  end

  def category
    @category = Category.find params[:category_id]
  end

end
