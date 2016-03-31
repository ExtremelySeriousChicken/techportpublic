# class OrderController < ApplicationController
#     skip_before_filter  :verify_authenticity_token
#     before_action :authenticate_user
    
#     #This method will create a new oder by trying
#     #to find the user's cart
#     def place
#         cart = Cart.where(user_id: params[:user_id])
        
#         if not cart
#             return render json: {message: "Error: Cart not found"}, status: 400
#         end

#         order = Order.new(
#             customer_id: params[:user_id],
#             status:      0
#             )

#         if not order.save
#             return render json: {message: "Error: Order failed to save"}, status: 400
#         end

#         #Get the latest order
#         order = Order.where(customer_id: params[:user_id]).order(created_at: :desc)[0]


#         #copy everything from cart into the orders
#         cart.each do | c |
#             oneItem = OrderItem.new(
#                 order_id: order.id,
#                 item_id:  c.id,
#                 quantity: c.quantity
#                 )

#             oneItem.save
#         end

#         Cart.destroy_all(user_id: params[:user_id])

#         return render json: {message: "Order has been created"}, status: 200
#     end

#     def destroy
#         order_id = params[:order_id]

#         order = Order.find_by(id: order_id)

#         if not order
#             return render json: {message: "Order cannot be found"}, status: 404
#         end

#         OrderItem.destroy_all(order_id: order_id)

#         order.destroy

#         return render json: {message: "The order has been destroyed"}, status: 200
#     end

#     def deliveraccept
#         # order_id 
#         order_id = params[:order_id]

#         order = Order.find_by(id: order_id)

#         if not order
#             return render json: {message: "Order cannot be found"}, status: 400
#         end

#         now = Time.now

#         order.update_attributes(
#             :status => 1,
#             :approved_at => now
#             )

#         return render json: {message: "Order successfully accepted"}, status: 200
#     end

#     def cancelaccept
#         order_id = params[:order_id]

#         order = Order.find_by(id: order_id)

#         if not order
#             return render json: {message: "Order cannot be found"}, status: 400
#         end

#         now = Time.now

#         order.update_attributes(
#             :status => 0,
#             :cancelled_at => now,
#             :deliverer_id => 0
#             )

#         return render json: {results: order, count: 1}, status: 200
#     end

#     def index
#         result = Array.new
#         orders = Order.all 

#         orders.each do | order |
#             oneResult = Hash.new

#             oneResult[:id] = order[:id]
#             oneResult[:customer_id] = order[:customer_id]
#             oneResult[:status] = order[:status]
#             oneResult[:approved_at] = order[:approved_at]
#             oneResult[:created_at] = order[:created_at]
#             oneResult[:updated_at] = order[:updated_at]
#             oneResult[:deliverer_id] = order[:deliverer_id]
#             oneResult[:cancelled_at] = order[:cancelled_at]

#             items = OrderItem.joins("LEFT OUTER JOIN items ON items.id = order_items.item_id").where(order_id: oneResult[:id]).select("items.*, order_items.*")


#             oneResult[:items] = items

#             result.push(oneResult)
#         end


        

#         return render json: {results: result, count: result.length}, status: 200
#     end

#     def show
#         order = Order.find_by(id: params[:id])

#         oneResult = Hash.new

#         oneResult[:id] = order[:id]
#         oneResult[:customer_id] = order[:customer_id]
#         oneResult[:status] = order[:status]
#         oneResult[:approved_at] = order[:approved_at]
#         oneResult[:created_at] = order[:created_at]
#         oneResult[:updated_at] = order[:updated_at]
#         oneResult[:deliverer_id] = order[:deliverer_id]
#         oneResult[:cancelled_at] = order[:cancelled_at]

#         items = OrderItem.joins("LEFT OUTER JOIN items ON items.id = order_items.item_id").where(order_id: oneResult[:id]).select("items.*, order_items.*")


#         oneResult[:items] = items

#         return render json: {results: oneResult, count: 1}, status: 200
#     end

#     def me
#         orders = Order.where(customer_id: params[:user_id])

#         result = Array.new

#         orders.each do | order |
#             oneResult = Hash.new

#             oneResult[:id] = order[:id]
#             oneResult[:customer_id] = order[:customer_id]
#             oneResult[:status] = order[:status]
#             oneResult[:approved_at] = order[:approved_at]
#             oneResult[:created_at] = order[:created_at]
#             oneResult[:updated_at] = order[:updated_at]
#             oneResult[:deliverer_id] = order[:deliverer_id]
#             oneResult[:cancelled_at] = order[:cancelled_at]

#             items = OrderItem.joins("LEFT OUTER JOIN items ON items.id = order_items.item_id").where(order_id: oneResult[:id]).select("items.*, order_items.*")


#             oneResult[:items] = items

#             result.push(oneResult)
#         end

#         return render json: {results: result, count: result.length}, status: 200

#     end

#     private
#     def authenticate_user
#         #get the user id
#         user_id = params[:user_id]

#         user = User.find_by(id: user_id)

#         if not user
#             return render json: {message: "Error: Users not found"}, status: 404
#         end


#         if not request.headers['Authorization']
#             return render json: {message: "Error: No token provided"}, status: 403
#         end

#         if not user.token ==  request.headers['Authorization']
#             return render json: {message: "Error: token is not correct"}, status: 403
#         end
#     end
# end
