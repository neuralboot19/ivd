class ApplicationController < ActionController::Base
  include Authentication
  include Authorization
  include Language
  include Error
end
