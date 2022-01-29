class UpdateChatsCountJob < ApplicationJob
  queue_as :default

  # This method is called when the job is executed to update the chats count
  def perform(application)
    application.update_chats_count
  end
end
