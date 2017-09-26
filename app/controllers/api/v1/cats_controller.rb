class Api::V1::CatsController < ApplicationController
    before_action :find_cat, only: [:show, :edit, :update, :destroy]

    def index
        render json: Cat.includes(:hobbies), include: ['hobbies']
    end

    def show
        render json: Cat.find(params[:id]), include: ['hobbies']
    end

    def create
        @cat = Cat.new(cat_params)
        if @cat.save
            render json: @cat
        else
            render json: {status: 500, err: 'cat could not be saved'}
        end
    end

    # api/v1/cats/1 PUT with JSON format
    def update
        @cat.update(cat_params)
        render json: @cat
    end

    def destroy
        @cat.destroy
        render json: {message: "successfully deleted!"}, status: 200
    end

    private
        def find_cat
            @cat = Cat.find(params[:id])
        end

        def cat_params
            params.require(:cat).permit(:name, :breed, :weight, :temperament, :hobby_ids => [])
        end
end
