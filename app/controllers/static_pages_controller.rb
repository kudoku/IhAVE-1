class StaticPagesController < ApplicationController
  before_action :logged_in_redirect

  def home
  end

  def about
  end

  def global_search_results
    
  end

  def logged_in_redirect
    if current_user
      redirect_to locations_url
    end
  end
end
