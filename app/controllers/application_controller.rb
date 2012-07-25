class ApplicationController < ActionController::Base
  protect_from_forgery

  def target_or(object)
  	if params[:target] && params[:target] == "back"
  			:back
  	elsif params[:target]
  		params[:target]
  	else
  		object
  	end
  end

  def authorize!(client)
  	unless session[:client] == client.code || admin?
  		reset_session
 			redirect_to root_path, :notice => "You are not authorized to view this page."
 		end
  end
end
