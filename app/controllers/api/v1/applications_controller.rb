module Api
  module V1
    class ApplicationsController < ApplicationController
      def show
        application = Application.where('token' => params[:token]).first
        render json: application
      end

      def create
        application = Application.new(application_params)

        if application.save
          render json: application, status: :created
        else
          render json: application.errors, status: :unprocessable_entity
        end
      end

      private

      def application_params
        params.require(:name)
        params[:token] = SecureRandom.hex
        params.permit(:name, :token)
      end
    end
  end
end
