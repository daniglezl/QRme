class UserTokenController < Knock::AuthTokenController

  def create
    uri = params["redirect_uri"] + "&token=#{auth_token.token}&state=#{params["state"]}"
    redirect_to uri
  end

  private

  def auth_params
    token = JWT.decode params[:token], nil, false
    params[:auth] = {}
    params[:auth][:email] = token[0]["data"]["email"]
    params[:auth][:password] = token[0]["data"]["password"]
    params.require(:auth).permit :email, :password
  end

end
