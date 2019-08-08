class ApplicationController < ActionController::Base
	add_flash_types :success, :danger, :error, :info, :warning
end
