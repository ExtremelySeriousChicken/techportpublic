class CartController < ApplicationController
    skip_before_filter  :verify_authenticity_token
    before_action :authenticate_user

    def add_one
        #find it
        cart_item = Cart.where(
            :user_id => params[:user_id],
            :item_id => params[:item_id]
            ).take

        #if the data exists in the cart, then we just add the 
        #quantity by one
        if cart_item
            num = 0

            puts "checking if cart_item"
            puts cart_item
            puts
            puts
            puts

            if cart_item[:quantity]
                num = cart_item[:quantity].to_i
            end
            num = num + 1

            if cart_item.update_attribute(:quantity, num)
                return render json: {results: cart_item, count: 1}, status: 200
            else
                return render json: {message: "Error: Updating quantity failed"}, status: 400
            end
        else
            cart_item = Cart.new(
                :user_id => params[:user_id],
                :item_id => params[:item_id],
                :quantity => 1
                )

            if cart_item.save
                return render json: {results: cart_item, count: 1}, status: 200
            else   
                return render json: {message: "Error: Unable to create a new item"}, status: 400
            end
        end
    end
    #This method will add the items at the add
    def add
        cart_item = Cart.where(
            :user_id => params[:user_id],
            :item_id => params[:item_id]
            ).take

        if cart_item
            num = cart_item[:quantity]
            num = num + params[:quantity].to_i

            if cart_item.update_attribute(:quantity, num)
                return render json: {results: cart_item, count: 1}, status: 200
            else
                return render json: {message: "Error: Updating quantity failed"}, status: 400
            end
        else
            cart_item = Cart.new(
                :user_id => params[:user_id],
                :item_id => params[:item_id],
                :quantity => params[:quantity]
                )

            if cart_item.save
                return render json: {results: cart_item, count: 1}, status: 200
            else
                return render json: {message: "Error: Unable to create new item"}, status: 400
            end
        end

    end

    #This one will remove certain item from certain person's cart
    def remove
        cart_item = Cart.where(
            :user_id => params[:user_id],
            :item_id => params[:item_id]
            ).take

        if not cart_item
            return render json: {message: "Error: Cannot find the specified data"}, status: 400
        end

        cart_item.destroy

        return render json: {message: "Item in cart successfully destroyed"}, status: 200

    end

    #This method will clear the users' cart
    def clear
        Cart.destroy_all(user_id: params[:user_id])

        return render json: {message: "clear was successfull"}, status: 200
    end

    def mycart
        cart = Cart.where(user_id: params[:user_id])

        return render json: {results: cart, count: cart.length}, status: 200
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
