class Api::V1::CatsController < ApiController

  PERMITTED = :title, :descript, :order_array

    def index
      respond_with Cat.all.sort_by{|cat| cat.id}, root: false, each_serializer: CatSerializer
    end

    def create
      respond_with Product.create(params[:product])
    end



    private


    def find_resource
      @resource = Cat.find(params[:id])
    end

end
