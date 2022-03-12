class CommandExecutionsController < ApplicationController
  skip_before_action :verify_authenticity_token, raise: false
  def create
    # pi on -> vcgencmd display_power 1
    # pi off -> vcgencmd display_power 0
    success = system(params[:cmd])
    render json: {success: success}, status: 200
  end
end
