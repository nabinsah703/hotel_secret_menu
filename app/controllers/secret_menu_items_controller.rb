class SecretMenuItemsController < ApplicationController
    def index
        @secretMenuItems = SecretMenuItem.all
        render json: @SecretMenuItems
    end

    def show
        @secretMenuItem = SecretMenuItem.find(params[:id])
        render json: @secretMenuItem
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
            status: 422,
            error: "Invalid Body"
        }
           
       end
        
    end
    
    def update
        @secretMenuItem = SecretMenuItem.find(params[:id])
        @secretMenuItem.update(
            menu_name: params[:menu_name],
            restaurant_name: params[:restaurant_name],
            menu_description: params[:menu_description]
        )
        render json: @secretMenuItem
    end

    def destroy
        @secretMenuItems = SecretMenuItem.all
        @secretMenuItem = SecretMenuItem.find(params[:id])
        @secretMenuItem.destroy
        render json: @secretMenuItem
    end
    
    private

    def secret_menu_item_params
      params.require(:secret_menu_item).permit(:menu_name, :restaurant_name, :menu_description)
    end


end
