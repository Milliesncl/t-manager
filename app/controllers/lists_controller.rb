class ListsController < ApplicationController
    def index
        @lists = List.all
    end

    def show
        @list = List.find(params[:id])
    end

    def new
        @list = List.new
    end

    def create
        @list = list.new(list_params)
        if @list.save
            redirect_to lists_path
        else
            render :new
        end
    end

    def destroy
        @lists = List.find(params[:id])
        if @list.destroy
            redirect_to lists_path
        else
            render
        end
    end

    private
    def list_params
        params.require(:list).permit(:title)
    end
end
