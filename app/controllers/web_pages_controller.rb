class WebPagesController < ApplicationController

  def home
    @categories = Category.all
  end
  
  def admin
  end

  def products
  end

  def services
  end

  def meetus
  end

  def location
  end

  def schedule
  end

end
