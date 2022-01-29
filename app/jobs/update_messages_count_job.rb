class UpdateMessagesCountJob < ApplicationJob
  queue_as :default

  # This method is called when the job is executed to update the messages count
  def perform(chat)
    chat.update_messages_count
  end
end
