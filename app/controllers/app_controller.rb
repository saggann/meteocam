class AppController < ApplicationController
  
  before_filter :authenticate_user!
  
  # start web application
  def start
    
  end
  
end
