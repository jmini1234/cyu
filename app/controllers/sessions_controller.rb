class SessionsController < ApplicationController
  def create
    user = from_omniauth(request.env["omniauth.auth"])
    session[:user_id] = user.id
    redirect_to :pets
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_path
  end

  private
  def from_omniauth(auth)
    user = User.where(provider: auth.provider, uid: auth.uid).first_or_initialize
    user.provider = auth.provider
    user.uid = auth.uid
    user.name = auth.info.name
    user.oauth_token = auth.credentials.token
    user.oauth_expires_at = Time.at(auth.credentials.expires_at)
    user.save
    return user
  end
end
