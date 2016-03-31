class StoreController < ApplicationController

    #This will return all the stores
    def index
        stores = Store.all

        count = stores.count

        return render json: {result: stores, count: count}, status: 200
    end

    #This controller will show one 
    def show
        store = Store.find_by(id: params[:id])

        return render json: {result: store, count: 1}, status: 200
    end

    #FIXME
    #TODODODODODODO TOO LAZAY
    def search
        #depends on what to search
        search_by = Hash.new

        if not params[:name].blank?
            search_by[:name] = params[:name]
        end

    end
end
