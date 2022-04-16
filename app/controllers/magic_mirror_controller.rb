class MagicMirrorController < ApplicationController
  skip_before_action :verify_authenticity_token, raise: false
  def index
    # messages
  end
end
