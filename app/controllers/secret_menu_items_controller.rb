class SecretMenuItemsController < ApplicationController
    before_action :find_secret_menu_item, only: [:show, :update, :destroy]
    
    def index
        @secret_menu_item = SecretMenuItem.all
        render json: @secret_menu_item
    end

    def show
        render json: @secret_menu_item
    end

    def create
        @secret_menu_item = SecretMenuItem.new(
            secret_menu_item_params  
        )

       if @secret_menu_item.valid?
            @secret_menu_item.save
            render json: @secret_menu_item
       else 
        render json: {
            status: :unprocessable_entity,
            error: "Invalid Body"
        }
       end
    end
    
    def update
        #@secret_menu_item = SecretMenuItem.update(secret_menu_item_params)
        #if @secret_menu_item.valid?
         #   @secret_menu_item.save
        #     render json: @secret_menu_item
            
        # else
        #     render json: @secret_menu_item.errors, status: :unprocessable_entity
        # end
        if @secret_menu_item.update(secret_menu_item_params) 
           render json: @secret_menu_item
        else
           render json: @secret_menu_item.errors, status: :unprocessable_entity

        end
    end

    def destroy
        @secret_menu_item.destroy
        render json: @secret_menu_item
    end
    
    private
    
   
    def find_secret_menu_item
        @secret_menu_item = SecretMenuItem.find(params[:id])
    end 

    def secret_menu_item_params
      params.require(:secret_menu_item).permit(:menu_name, :restaurant_name, :menu_description)
    end
end
