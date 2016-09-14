class PageController < ApplicationController
  before_action :authenticate_user!, except:[:about]	
  
  def home
  end

  def wall
  end

  def about
  end

  def post 
  end
end
