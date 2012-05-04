class ServicesController < ApplicationController
  before_filter :signed_in_user, only: [:new, :create, :update, :destroy, :edit]

  def show
    @service = Service.find(params[:id])
  end

  def create
    @category = Category.find(params[:service]['category_id'])
    @service = @category.services.build(params[:service])
    if @service.save
      flash[:success] = t('service-created')
      redirect_to services_path
    else
      render 'web_pages/home'
    end
  end

  def new
    @category = Category.find(params[:category_id])
    @service = @category.services.build
  end  

  def edit
    @service = Service.find(params[:id])
  end

  def update
    @service = Service.find(params[:id])
    if @service.update_attributes(params[:service])
      flash[:success] = t('service-updated')
      redirect_to @service
    else
      render 'edit'
    end
  end

  def index
    @categories = Category.all
  end

  def destroy
    Service.find(params[:id]).destroy
    flash[:success] = t('service-deleted')
    redirect_to current_user
  end
  
end
