class UsersController < ApplicationController
  skip_before_filter  :verify_authenticity_token
  def create
    #get the user params
    name  = params[:name]
    email = params[:email] 
    password = params

    user = User.new(
        name: params[:name],
        email: params[:email],
        password: params[:password],
        password_confirmation: params[:password_confirmation])

    if user.save
        user = User.find_by(email: params[:email])
        return render json: {result: user, count: 1}, status: 200
    else
        return render json: {message: "Error saving"}, status: 400
    end
  end

end
