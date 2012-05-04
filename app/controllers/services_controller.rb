class ServicesController < ApplicationController
  before_filter :signed_in_user, only: [:new, :create, :update, :destroy, :edit]

  def show
    @service = Service.find(params[:id])
  end

  def create
    @service = Service.new(params[:service])
    if @service.save
      flash[:success] = t('service-created')
      redirect_to @service
    else
      render 'web_pages/home'
    end
  end

  def new
    @service = Service.new
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
    @services = Service.paginate(page: params[:page])
  end

  def destroy
    Service.find(params[:id]).destroy
    flash[:success] = t('service-deleted')
    redirect_to current_user
  end
  
end
