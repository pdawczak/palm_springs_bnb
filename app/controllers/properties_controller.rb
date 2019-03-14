class PropertiesController < ApplicationController
  before_action :set_property, only: [:show]

  # GET /properties
  def index
    @properties_by_city = Property.all.group_by(&:city)
  end

  # GET /properties/1
  def show
  end

  # GET /properties/new
  def new
    @property = Property.new
  end

  # POST /properties
  def create
    @property = Property.new(property_params)

    if @property.valid?
      Ml.estimate_prices(@property)
      @property.save
      redirect_to @property, notice: 'Property was successfully created.' 
    else
      render :new 
    end
  end

  private
    def set_property
      @property = Property.find(params[:id])
    end

    def property_params
      params.require(:property)
        .permit(
          :number_of_beds,
          :number_of_bathrooms,
          :number_of_bedrooms,
          :number_of_people,
          :city
        )
    end
end
