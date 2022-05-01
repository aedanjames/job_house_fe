class Search::HousesController < ApplicationController
  before_action :authorized, except: [:index, :show]

  def index
    @location = params[:location]
    if  params[:location].present? && params[:max_price].present?
      @houses = HouseFacade.house_index(params[:location], params[:max_price])
    end
  end

end