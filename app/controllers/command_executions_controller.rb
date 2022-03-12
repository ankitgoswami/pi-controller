class CommandExecutionsController < ApplicationController
  skip_before_action :verify_authenticity_token, raise: false
  def create
    success = system(params[:cmd])
    render json: {success: success}, status: 200
  end
end
