class V1::BaseController < ApplicationController
  def error_response(obj)
    render json: { errors: ErrorSerializer.serialize(obj) }, status: :unprocessable_entity
  end
end
