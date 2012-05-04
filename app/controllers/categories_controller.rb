class CategoriesController < ApplicationController
  before_filter :signed_in_user, only: [:new, :create, :update, :destroy, :edit]

  def create
    @category = Category.new(params[:category])
    if @category.save
      flash[:success] = t('category-created')
      redirect_to services_path
    else
      render 'web_pages/home'
    end
  end

  def new
    @category = Category.new
  end  

  def edit
    @category = Category.find(params[:id])
  end

  def update
    @category = Category.find(params[:id])
    if @category.update_attributes(params[:category])
      flash[:success] = t('category-updated')
      redirect_to services_path
    else
      render 'edit'
    end
  end

  def destroy
    Category.find(params[:id]).destroy
    flash[:success] = t('category-deleted')
    redirect_to services_path
  end
  
end
