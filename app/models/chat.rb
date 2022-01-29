class Chat < ApplicationRecord
  belongs_to :application

  def as_json(options = {})
    super(options.merge({except: [:id, :application_id]}))
  end

  # This method is called when the job is executed to update the messages count
  def update_messages_count
    self.messages_count = Message.where(chat_id: id).count
    save
  end

  # This method is called after a message is created to run the job
  after_create_commit do
    UpdateChatsCountJob.set(wait: 10.second).perform_later(application)
  end
end
