class SessionsController < ApplicationController
    include SessionsHelper
    skip_before_filter  :verify_authenticity_token
    def create
        user = User.find_by(email: params[:email].downcase)
        if user && user.authenticate(params[:password])
            token = login(user)

            return render json: {token: token, user_id: user.id}, status: 200
            #return the user
        end

        return render json: {message: "Error: Could not log in"}, status: 400
    end

    def destroy
        user = User.find_by(id: params[:user_id])
        if not user
            return render json: {message: "Error: user does not exist"}, status: 400
        end

        token = ""

        if request.headers['Authorization']
            token = request.headers['Authorization']
        end

        if user && user.token_authenticate(token)
            #if there exist user with such id and the token is correct
            user.update_attribute(:token, "")
            return render json: {message: "Logged Out successfully"}, status: 200
        else
            return render json: {message: "Error: Token is incorrect"}, status: 200

        end
    end

end
