class Application < ApplicationRecord
  validates :name, presence: true, uniqueness: true

  def as_json(options = {})
    super(options.merge({ except: [:id] }))
  end

  # This method is called when the job is executed to update the chats count
  def update_chats_count
    self.chats_count = Chat.where(application_id: self.id).count
    self.save
  end
end
