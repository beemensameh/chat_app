class Message < ApplicationRecord
  belongs_to :chat
  validates :content, presence: true

  def as_json(options = {})
    super(options.merge({ except: [:id, :chat_id] }))
  end

  # This method is called after a message is created to run the job
  after_create_commit do
    UpdateMessagesCountJob.set(wait: 10.second).perform_later(self.chat)
  end
end
