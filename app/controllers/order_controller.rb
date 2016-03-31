class OrderController < ApplicationController
    skip_before_filter  :verify_authenticity_token

    def create
        order = Order.new(
            phone_number: params[:phone_number],
            item:         params[:item],
            description: params[:description],
            message:      params[:message],
            time_left:    params[:time_left]
            )

        if order.save
            return render json: {results: order, count: 1}, status: 200
        else
            return render json: {message: "Error creating the data"}, status: 400
        end
    end

    def destroy
        order = Order.find_by(id: params[:order_id])

        if not order
            return render json: {message: "Order is not found"}, status: 400
        end

        order.destroy

        return render json: {message: "Data has been destroyed successfully"}, status: 200
    end

    def index
        orders = Order.all 

        return render json: {results: orders, count: orders.length}, status: 200
    end

    def getRequest
        orders = Order.where(status: 0)

        return render json: {results: orders, count: orders.length}, status: 200
    end

    def acceptRequest
        order_id = params[:order_id]

        order = Order.find_by(id: order_id)

        if not order
            return render json: {message: "Order cannot be found"}, status: 400
        end

        now = Time.now

        order.update_attributes(
            :deliverer_id => params[:user_id],
            :status => 1,
            :approved_at => now
            )

        return render json: {message: "Order successfully accepted"}, status: 200
    end

    def cancelRequest
        order_id = params[:order_id]

        order = Order.find_by(id: order_id)

        if not order
            return render json: {message: "Order cannot be found"}, status: 400
        end

        now = Time.now

        order.update_attributes(
            :status => 0,
            :cancelled_at => now,
            :deliverer_id => 0
            )

        return render json: {results: order, count: 1}, status: 200
    end

    def sentRequest
        order_id = params[:order_id]

        order = Order.find_by(id: order_id)

        if not order 
            return render json: {message: "Error: order id not found"}, status: 400
        end

        now = Time.now

        order.update_attributes(
            status: 3,
            sent_at:  now
            )

        return render json: {results: order, count: 1}, status: 200
    end

    def myPending
        orders = Order.where(deliverer_id: params[:user_id], status: 1)

        return render json: {results: orders, count: orders.length}, status: 200
    end

    def myHistory
        orders = Order.where(deliverer_id: params[:user_id])

        return render json: {results: orders, count: orders.length}, status: 200
    end

    private
    def authenticate_user
        #get the user id
        user_id = params[:user_id]

        user = User.find_by(id: user_id)

        if not user
            return render json: {message: "Error: Users not found"}, status: 404
        end


        if not request.headers['Authorization']
            return render json: {message: "Error: No token provided"}, status: 403
        end

        if not user.token ==  request.headers['Authorization']
            return render json: {message: "Error: token is not correct"}, status: 403
        end
    end
end
