class HousesrentController < ApplicationController


    def index
        if params[:search]
          @properties = Property.search(params[:search]).order("name").paginate(page: params[:page], per_page: 6)
        else
          @properties = Property.for_rent.paginate(page: params[:page], per_page: 6) 
        end 
  end

  def self.search(search) 
    where("name ILIKE ?", "%#{search}%") 
  end

end
