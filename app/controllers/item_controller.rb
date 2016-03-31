class ItemController < ApplicationController
    def index 
        items = Item.all 

        count = items.count

        return render json: {results: items, count: count}, status: 200
    end

    def show
        item = Item.find_by(id: params[:id])



        return render json: {results: item, count: 1}, status: 200
    end
end
