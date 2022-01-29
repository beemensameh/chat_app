module Api
  module V1
    class ChatsController < ApplicationController
      def show
        application = Application.where('token' => params[:application_token]).first
        chat = Chat.where('application_id' => application.id).where('chat_number' => params[:chat_number]).first

        render json: chat
      end

      def create
        application = Application.where('token' => params[:application_token]).first
        chat = Chat.where('application_id' => application.id).count

        params[:application_id] = application.id
        params[:chat_number] = chat + 1

        chat = Chat.new(chat_params)

        if chat.save
          render json: chat, status: :created
        else
          render json: chat.errors, status: :unprocessable_entity
        end
      end

      private

      def chat_params
        params.permit(:application_id, :chat_number)
      end
    end
  end
end
