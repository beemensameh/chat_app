class Message < ApplicationRecord
  belongs_to :chat
  validates :content, presence: true

  def as_json(options = {})
    super(options.merge({ except: [:id, :chat_id] }))
  end
end
