class ApiController < ApplicationController
  require 'concerns/controllerconcerns'
  include Query_scopes
  respond_to :json
  before_action :find_resource, only: [:show, :update, :destroy]

  def show
    respond_with @resource, root: false, each_serializer: (self.class.to_s + 'Serializer')
  end

  def update
    if @resource.update(permitted_params)
      respond_with @resource, root: false, each_serializer: (self.class.to_s + 'Serializer')
    end
  end

  def destroy
    respond_with @resource.destroy  # @resource.destroy
  end

  private
  def permitted_params
    params.permit(self.class::PERMITTED)
  end

end