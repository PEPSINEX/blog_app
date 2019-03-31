class ApplicationController < ActionController::Base
  add_flash_types :success, :danger # bootstrap用にflashを追加
end
