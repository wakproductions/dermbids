class HomeController < ApplicationController
  def index
    if Rails.env.test?
      head :ok
    else
      redirect_to 'http://www.dermbids.com'
    end
  end
end
