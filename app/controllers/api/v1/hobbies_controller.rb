class Api::V1::HobbiesController < ApplicationController

    def index
        render json: Hobby.includes(:cats), include: ['cats']
    end

    def show
        render json: Hobby.find(params[:id]), include: ['cats']
    end

    

end
