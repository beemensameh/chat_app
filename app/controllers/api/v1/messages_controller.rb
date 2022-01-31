module Api
  module V1
    class MessagesController < ApplicationController
      def index
        application = Application.where("token" => params[:application_token]).first
        if application.nil?
          render json: { error: "Application not found" }, status: :not_found
        end
        chat = Chat.where("application_id" => application.id).where("chat_number" => params[:chat_number]).first
        if chat.nil?
          render json: { error: "Chat not found" }, status: :not_found
        end
        messages = if params[:query].present?
          Message.where("chat_id" => chat.id).search(query: {multi_match: {query: params[:query], fuzziness: 2, fields: ["content"]}}).records
        else
          Message.where("chat_id" => chat.id)
        end

        render json: messages
      end

      def create
        application = Application.where("token" => params[:application_token]).first
        if application.nil?
          render json: { error: "Application not found" }, status: :not_found
        end
        chat = Chat.where("application_id" => application.id).where("chat_number" => params[:chat_number]).first
        if chat.nil?
          render json: { error: "Chat not found" }, status: :not_found
        end
        messages = Message.where("chat_id" => chat.id).count

        params[:chat_id] = chat.id
        params[:message_number] = messages + 1

        message = Message.new(message_params)

        if message.save
          render json: message, status: :created
        else
          render json: message.errors, status: :unprocessable_entity
        end
      end

      private

      def message_params
        params.require(:content)
        params.permit(:chat_id, :message_number, :content)
      end
    end
  end
end
