class SessionsController < ApplicationController

    def create
        user = User.find_by(email: params[:email])
        if user.authenticate(params[:password])
            jwt = Auth.issue({user: user.id})
            render json: {jwt: jwt}
        else
            render json: {error: "failed to authenticate user"}, status: 500
        end
    end

    private
        # def auth_params
        #     params.require(:auth).permit(:email, :password)
        # end
end
